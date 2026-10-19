import pandas as pd
from sqlalchemy import create_engine

# 1. Configuración de la conexión a MySQL local
USUARIO = 'root'
PASSWORD = 'michimiau'
HOST = '127.0.0.1'
PUERTO = '3306'
BASE_DATOS = 'proyecto_nomina_educativa'

cadena_conexion = f"mysql+pymysql://{USUARIO}:{PASSWORD}@{HOST}:{PUERTO}/{BASE_DATOS}"
engine = create_engine(cadena_conexion)


def cargar_datos():
    print("1. Leyendo archivos CSV...")
    # Cargar ambos archivos y unirlos en un solo DataFrame
    df1 = pd.read_csv('Proyecto/puebla_01trimestre2026_dgsanef.csv')
    df2 = pd.read_csv('Proyecto/puebla_2trimestre2026_dgsanef.csv')
    df_completo = pd.concat([df1, df2], ignore_index=True)

    print("2. Procesando y normalizando Entidades Federativas...")
    df_entidades = pd.DataFrame(
        df_completo['ent_fed'].unique(), columns=['nombre_entidad'])
    df_entidades['id_entidad'] = range(1, len(df_entidades) + 1)

    # Mapear el id_entidad de regreso al dataset principal
    df_completo = df_completo.merge(
        df_entidades, left_on='ent_fed', right_on='nombre_entidad', how='left')

    print("3. Procesando Centros de Trabajo...")
    columnas_ct = ['cv_ct', 'nom_ct', 'tipo_edu', 'id_entidad']
    df_centros = df_completo[columnas_ct].drop_duplicates(subset=['cv_ct'])
    df_centros = df_centros.rename(
        columns={'nom_ct': 'nombre_ct', 'tipo_edu': 'tipo_educacion'})

    print("4. Procesando Catálogo de Puestos...")
    columnas_puesto = ['puesto', 'tipo', 'tipo_fun', 'tipo_pl']
    df_puestos = df_completo[columnas_puesto].drop_duplicates(
    ).reset_index(drop=True)
    df_puestos['id_puesto'] = range(1, len(df_puestos) + 1)
    df_puestos = df_puestos.rename(columns={
        'puesto': 'nombre_puesto',
        'tipo': 'tipo_contrato',
        'tipo_fun': 'tipo_funcion',
        'tipo_pl': 'tipo_plaza'
    })

    # Mapear el id_puesto de regreso al dataset principal
    df_completo = df_completo.merge(
        df_puestos,
        left_on=['puesto', 'tipo', 'tipo_fun', 'tipo_pl'],
        right_on=['nombre_puesto', 'tipo_contrato',
                  'tipo_funcion', 'tipo_plaza'],
        how='left'
    )

    print("5. Preparando tabla de Nóminas (Hechos)...")
    df_nominas = df_completo[[
        'cv_pres', 'ejer_fis', 'num_trim', 'remuneracion',
        'responsable', 'fecha_actualizacion', 'cv_ct', 'id_puesto'
    ]].copy()

    df_nominas = df_nominas.rename(columns={
        'cv_pres': 'clave_presupuestal',
        'ejer_fis': 'ejercicio_fiscal',
        'num_trim': 'trimestre'
    })

    # Asegurar el formato correcto de fecha
    df_nominas['fecha_actualizacion'] = pd.to_datetime(
        df_nominas['fecha_actualizacion']).dt.date

    print("6. Insertando datos en MySQL (Esto puede tomar unos segundos)...")
    # Carga masiva a la base de datos respetando el orden de las llaves foráneas
    df_entidades.to_sql('entidades_federativas', con=engine,
                        if_exists='append', index=False)
    df_centros.to_sql('centros_trabajo', con=engine,
                      if_exists='append', index=False)
    df_puestos.to_sql('puestos', con=engine, if_exists='append', index=False)
    df_nominas.to_sql('nominas', con=engine, if_exists='append', index=False)

    print("¡Carga completada con éxito!")


if __name__ == "__main__":
    cargar_datos()

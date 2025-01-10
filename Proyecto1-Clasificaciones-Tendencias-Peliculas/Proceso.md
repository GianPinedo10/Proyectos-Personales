# Proceso realizado
### 1. Carga de los datos
- El primer paso fue importar los datos desde el archivo CSV obtenido en la fuente proporcionada
### 2. Eliminación de columnas innecesarias
- Se eliminaron las columnas de Poster_Link y Overview debido a que no iban a ser útiles para el análisis
### 3. Limpieza de los datos
- Para identificar los valores faltantes se utilizó el formato condicional y se resaltaron las celdas vacías. Habían valores faltantes en las columnas de: Certificate, Meta_Score y Gross.
- Para la columna Certificate se utilizó la herramienta Buscar y reemplazar, rellenando las celdas vacías con "Desconocido"
- En el caso de las demás columnas se rellenaron con valores aleatorios que se encontraban en el intervalo de la columna (Meta_Score y Gross)
- No se encontraron valores duplicados  

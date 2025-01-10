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
### 4. Creación  de nuevas columnas
- Se creó la columna Década de Estreno derivada de la columna Released_Year para un análisis más sencillo y eficiente. Para ello, se usó la función de CONCATENAR. 
- Se creó la columna RunTime-Categorias derivada de la columna RunTime para agrupar los valores en 3 categorias. Se usó la función condicional SI. El criterio fue el siguiente:
  - Duración corta: Películas con una duración menor a 90 minutos
  - Duración media: Películas con una duración mayor a 90 minutos pero menor o igual a 120 minutos
  - Duración larga: Películas con una duración mayor a 120 minutos
- Se creó la columna Meta_Score-Categorias derivada de la columna Meta_score para clasificar las puntuaciones. De igual forma, se utilizó la función condicional SI. El criterio fue el siguiente:
  - Score bajo: Valores entre 0-50
  - Score medio: Valores entre 51-75
  - Score alto: Valores entre 76-100
- Por último se creó la columna Género Principal derivado de la columna Genre para poder realizar el análisis individualmente de cada género ya que originalmente se tienen varios géneros agrupados lo que dificulta la interpretación. Se usó la función INDICE y DIVIDIRTEXTO
### 5. Creación  de tablas dinámicas y gráficos 
En esta etapa, se diseñó y configuró las tablas dinámicas para facilitar el análisis y la visualización de los datos. En total se crearon 8 tablas dinámicas y con ello se pudieron crear los gráficos correspondientes.
### 6. Creación  del dashboard
En una hoja nueva, se recopilaron y organizaron todos los gráficos generados para resumir de manera visual los hallazgos claves del análisis. Además, se insertaron segmentaciones de datos, permitiendo filtrar según criterios específicos(Certificate y RuntTime-Categorias)
### 7. Conclusiones
En esta sección se resumen los hallazgos más importantes obtenidos a partir del análisis de los datos:
- Los géneros con mayores ingresos promedio son: Fantasy y Action. Por otro lado, los géneros con menores ingresos promedio son Thriller y Western 
- Las películas clasificadas con un Meta_Score alto tienen una distribución de ingresos del 53.28% en comparación con las películas clasificadas con un Meta_Score medio(37.03%) y Meta_Score bajo(9.69%)
- 


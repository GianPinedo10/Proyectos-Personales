# Proceso realizado
### 1. Creación de la base de datos
Se creó la base de datos llamada Pizza BD, la cual va a contener la tabla necesaria para almacenar la información relacionada con las ventas de pizzas.
### 2. Carga de los datos
Se importó el archivo CSV dentro de la base de datos creada anteriormente con toda la información de las ventas de pizzas.
### 3. Análisis Exploratorio con consultas SQL
Se realizaron diversas consultas SQL para explorar y analizar los datos de las ventas de pizzas. Para mayor detalle, todas las consultas utilizadas en el proyecto están en el archivo [Consultas SQL](https://github.com/GianPinedo10/Proyectos-Personales/blob/main/Proyecto2-%20An%C3%A1lisis%20de%20Ventas%20de%20Pizza/Consultas%20SQL.sql).
### 4. Importación base de datos en Power Bi
Después de finalizar con el análisis exploratorio en SQL es necesario importar la base de datos en Power BI. 
### 5. Transformación de datos
Antes de construir los reportes, se utilizaron herramientas de transformación en Power Query para limpiar y estructurar los datos. Los cambios que se hicieron fueron los siguientes:
- Reemplazo de valores en pizza_size: L por Grande, M por Mediana, S por Pequeña, XL por Extra Grande y XXL por Doble Extra Grande. 
- Creación de columnas derivadas a partir de la columna order_date. Esto fue necesario para poder determinar exactamente los días y meses con más pedidos. Algunas de las funciones que se utilizaron fueron UPPER, para colocar el día y el mes en mayúscula y LEFT, para extraer solamente las 3 primeras letras de cada día y mes, pudiéndose apreciar visualmente en los dashboards.
### 6. Creación de medidas
Se crearon diferentes medidas utilizando el lenguaje DAX que incluyeron los siguientes cálculos:
- Gasto promedio por pedido
- Promedio de pizzas por orden
- Total de ingresos
- Total de órdenes
- Total de pizzas vendidas




# Proyecto 2: Análisis de Ventas de Pizza: Tendencias y Preferencias del Cliente
## Descripción del Proyecto:
Exploración y análisis de un dataset centrado en las ventas de pizzas de un restaurante durante el año 2015. Este proyecto combina consultas realizadas en Microsoft SQL Server para extraer información clave y el diseño de dashboards interactivos con Power BI, ofreciendo una visión clara y dinámica del rendimiento por categorías, tamaños de pizza y tendencias generales de ventas.

Para poder visualizar el dashboard interactivo en Power Bi es necesario ingresar a este [enlace](https://app.powerbi.com/view?r=eyJrIjoiZjIzM2U0ZjctNWRlYi00N2MwLWIwMzQtNmJkY2U2NWI2YzlkIiwidCI6ImU0NmQzODYyLTg1OTUtNDVkMS05YjY5LTYzMDc5OGQ4OTAyZCIsImMiOjR9&pageName=c56b29c87c2ab31f3f06).
![image](https://github.com/user-attachments/assets/e6986cd0-7bfe-46ff-a4b3-e7f19bd09656)
![image](https://github.com/user-attachments/assets/41abb93c-bc73-4112-8000-8abacaa06d8c)


## Objetivos Generales
1. Identificar oportunidades de mejora en la oferta del restaurante mediante el análisis de datos de las ventas.
2. Evaluar el rendimiento de las diferentes categorías y tamaños de pizzas ofrecidas por el restaurante en términos de ingresos y popularidad.
3. Analizar las ventas de pizzas para comprender las preferencias de los clientes.

## Dataset
**Fuente**: https://www.kaggle.com/datasets/shilongzhuang/pizza-sales

**Contenido**: El dataset contiene información de las ventas de pizza de un restaurante con las siguientes columnas:
 - **order_id**: Identificador único para cada pedido realizado por una mesa.
  - **order_details_id**: Identificador único para cada pizza colocada dentro de cada pedido.
  - **pizza_id**: Identificador único que vincula la pizza solicitada con sus detalles.
  - **quantity**: Cantidad pedida para cada pizza.
  - **order_date**: Fecha en que se realizó el pedido.
  - **order_time**: Hora en que se realizó el pedido.
  - **unit_price**: Precio de la pizza en USD.
  - **total_price**: unit_price * quantity.
 - **pizza_size**: Tamaño de la pizza(S, M, L, XL, XXL).
  - **pizza_category**: Categoría de la pizza(Classic, Veggie, Supreme, Chicken).
  - **pizza_ingredients**: Ingredientes utilizados en la pizza.
  - **pizza_name**: Nombre de la pizza como se muestra en el menú.

    
## Hallazgos Clave
-  Los días con más órdenes fueron viernes y sábado, reflejando una mayor cantidad de clientes los fines de semana.
-  Los meses de julio y mayo registraron los mayores volúmenes de pedidos.
-  La pizza tipo Classic generó el mayor porcentaje de ingresos con un 26.91% del total.
-  La pizza de tamaño Grande representó un 45.89% de los ingresos totales.
-  Entre todas las pizzas, La Thai Chicken Pizza fue la que más contribuyó a los ingresos generales.
-  Por otro lado, La Brie Carre Pizza tuvo el menor impacto en las ventas.

  
## Recomendaciones
-  Analizar los tiempos de preparación y entrega en los días más ocupados para mejorar la eficiencia y la satisfacción del cliente. Es importante que se pueda gestionar todo de manera correcta.
-  Ofrecer descuentos especiales o promociones durante los días de baja demanda para atraer a más clientes.
-  Priorizar en términos de stock de ingredientes las pizzas de Tamaño Grande y tipo Classic.
-  Considerar utilizar la Thai Chicken Pizza en diversas situaciones, como campañas de publicidad o incluyéndola en ofertas especiales.
-  En el caso de la Brie Carre Pizza lo mejor sería reemplazarla por una nueva opción en el menú dado el bajo rendimiento que tuvo. Sin embargo, otra opción podría ser reducir el precio de esta pizza.
  

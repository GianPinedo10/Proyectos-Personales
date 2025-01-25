/* Consultas utilizadas para el proyecto */

-- 1.
-- Total de ingresos por las órdenes de pizza 
SELECT SUM(total_price) AS Total_Ingresos from pizza_sales
    
-- Total de ingresos por categoría
SELECT 
    pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Ingresos
FROM 
    pizza_sales
GROUP BY 
    pizza_category
ORDER BY 
    Total_Ingresos DESC;

-- 2. 
-- Gasto promedio por pedido
SELECT SUM(total_price)/ COUNT(DISTINCT(order_id)) AS GastoPromedio_Pedido FROM pizza_sales

-- 3. 
-- Pizzas vendidas en total
SELECT SUM(quantity) from pizza_sales

-- Pizzas vendidas en total por mes
SELECT MONTH(order_date) AS Mes, SUM(quantity) AS Total_Pizzas_Vendidas FROM pizza_sales
GROUP BY MONTH(order_date)
ORDER BY Mes;

-- 4. 
-- Promedio de pizzas por orden
SELECT SUM(quantity)/ COUNT(DISTINCT order_id) AS Promedio_Pizzas_Orden from pizza_sales

-- 5.
-- Las 5 pizzas que mas ingresos generaron
SELECT TOP 5 
    pizza_name, 
    SUM(total_price) AS Total_Ingresos
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Ingresos DESC;

-- 6.
-- Días con más pedidos totales
SELECT 
    DATENAME(WEEKDAY, order_date) AS Dia_Semana, 
    COUNT(DISTINCT order_id) AS Total_Pedidos
FROM 
    pizza_sales
GROUP BY 
    DATENAME(WEEKDAY, order_date), DATEPART(WEEKDAY, order_date)
ORDER BY 
    DATEPART(WEEKDAY, order_date);

-- 7.
-- Porcentaje de ingresos generados por tamaño de pizza 
SELECT 
    pizza_size, 
    CAST(SUM(total_price) * 100.0 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS Porcentaje_Ingresos
FROM 
    pizza_sales
GROUP BY 
    pizza_size;

-- 8. 
-- Las 5 pizzas que menos ingresos generaron 
    SELECT TOP 5 
    pizza_name, 
    CAST(SUM(total_price) AS DECIMAL (10,2)) AS Total_Ingresos
FROM 
    pizza_sales
GROUP BY 
    pizza_name
ORDER BY 
    Total_Ingresos ASC;

-- Consultas SQL extras 
-- 1. 
-- Porcentaje de pizzas que contienen queso 
SELECT 
    CAST((SUM(quantity) * 100.0) / (SELECT SUM(quantity) FROM pizza_sales) AS DECIMAL(10, 2)) AS Porcentaje_Con_Queso
FROM 
    pizza_sales
WHERE 
    pizza_ingredients LIKE '%Cheese%';

-- 2. 
-- Categorías de pizza que se pidieron más durante los fines de semana
SELECT 
    pizza_category, 
    SUM(quantity) AS Cantidad
FROM 
    pizza_sales
WHERE 
    DATENAME(WEEKDAY, order_date) IN ('Friday','Saturday', 'Sunday')
GROUP BY 
    pizza_category
ORDER BY 
    Total_Ventas DESC;











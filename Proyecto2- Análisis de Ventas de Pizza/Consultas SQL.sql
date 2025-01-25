/* Consultas utilizadas para el proyecto */

-- 1. Total de ingresos por las órdenes de pizza 
SELECT SUM(total_price) AS Total_Ingresos from pizza_sales
    
-- 1.1. Total de ingresos por categoría 
SELECT 
    pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Ingresos
FROM 
    pizza_sales
GROUP BY 
    pizza_category
ORDER BY 
    Total_Ingresos DESC;

--2. Gasto promedio por pedido
SELECT SUM(total_price)/ COUNT(DISTINCT(order_id)) AS GastoPromedio_Pedido FROM pizza_sales

--3. Pizzas vendidas en total
SELECT SUM(quantity) from pizza_sales

--3. Pizzas vendidas en total por mes
SELECT MONTH(order_date) AS Mes, SUM(quantity) AS Total_Pizzas_Vendidas FROM pizza_sales
GROUP BY MONTH(order_date)
ORDER BY Mes;





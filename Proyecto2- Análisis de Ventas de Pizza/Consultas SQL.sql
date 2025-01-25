/* Consultas utilizadas para el proyecto */

-- 1. Total de ingresos por las órdenes de pizza 
SELECT SUM(total_price) AS Total_Ingresos from pizza_sales
    
-- 1.1 Total de ingresos por categoría 
SELECT 
    pizza_category, 
    CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Ingresos
FROM 
    pizza_sales
GROUP BY 
    pizza_category
ORDER BY 
    Total_Ingresos DESC;



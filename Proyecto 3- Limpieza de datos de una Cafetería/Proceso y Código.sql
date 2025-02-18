/* Proceso y código utilizado para la limpieza de los datos */
-- 1. Es necesario convertir los valores "ERROR" y "UNKNOWN" a NULL porque se realizará el conteo de los valores inválidos y nulos de forma general.
-- Convertir ERROR a NULL 
UPDATE cafe_sales
SET 
    Item = NULLIF(item, 'ERROR'),
    Payment_Method = NULLIF(Payment_Method, 'ERROR'),
   Location = NULLIF(Location, 'ERROR'),
    Transaction_Date = CASE 
        WHEN CAST(Transaction_Date AS NVARCHAR) = 'ERROR' THEN NULL 
        ELSE Transaction_Date 
    END
WHERE 
    Item = 'ERROR' OR
   Payment_Method = 'ERROR' OR
    Location = 'ERROR' OR
    CAST(Transaction_Date AS NVARCHAR) = 'ERROR';

-- Convertir UNKNOWN a NULL 
UPDATE cafe_sales
SET 
    Item = NULLIF(Item, 'UNKNOWN'),
    Payment_Method = NULLIF(Payment_Method, 'UNKNOWN'),
    Location = NULLIF(Location, 'UNKNOWN'),
    Transaction_Date = CASE 
        WHEN CAST(Transaction_Date AS NVARCHAR) = 'UNKNOWN' THEN NULL 
        ELSE Transaction_Date 
    END
WHERE 
    Item = 'UNKNOWN' OR
    Payment_Method = 'UNKNOWN' OR
    Location = 'UNKNOWN' OR
    CAST(Transaction_Date AS NVARCHAR) = 'UNKNOWN';
-- 2. Contar valores NULL para saber la cantidad exacta que hay.
SELECT 
    SUM(CASE WHEN Item IS NULL THEN 1 ELSE 0 END) AS NULL_Item,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS NULL_Quantity,
    SUM(CASE WHEN Price_Per_Unit IS NULL THEN 1 ELSE 0 END) AS NULL_Price_Per_Unit,
    SUM(CASE WHEN Total_Spent IS NULL THEN 1 ELSE 0 END) AS NULL_Total_Spent,
    SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END) AS NULL_Payment_Method,
    SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS NULL_Location,
    SUM(CASE WHEN Transaction_Date IS NULL THEN 1 ELSE 0 END) AS NULL_Transaction_Date
FROM 
    cafe_sales;
-- 3. Para rellenar las celdas que contienen valores nulos se realiza lo siguiente en cada columna: 
--  Price_Per_Unit:
-- Se usa un Self Join, y lo que hará es colocar a los productos que tienen un precio nulo el precio correspondiente según el nombre del producto.
UPDATE a
SET a.Price_Per_Unit = b.Price_Per_Unit
FROM cafe_sales a
JOIN cafe_sales b
    ON a.Item = b.Item
WHERE a.Price_Per_Unit IS NULL 
    AND b.Price_Per_Unit IS NOT NULL;
-- Los valores nulos que quedan se terminan rellenando dividiendo el Total_Spent entre Quantity.
UPDATE cafe_sales
SET Price_Per_Unit = Total_Spent / Quantity
WHERE Price_Per_Unit IS NULL AND Quantity > 0;
-- 4. Quantity:
-- Se rellenan los valores nulos diviendo el Total_Spent entre Price_Per_Unit.
UPDATE cafe_sales
SET Quantity = Total_Spent / Price_Per_Unit
WHERE Quantity IS NULL AND Price_Per_Unit > 0;
-- Los valores nulos que quedan se terminan rellenando con valores aleatorios entre 1 y 5 ya que no había otra manera de saber la cantidad de productos que
-- compra cada cliente.
UPDATE cafe_sales
SET Quantity = FLOOR(RAND(CHECKSUM(NEWID())) * 5) + 1
WHERE Quantity IS NULL;	
-- 5. Total_Spent: 
-- El total_Spent se calcula multiplicando Quantity * Price_Per_Unit.
UPDATE cafe_sales
SET Total_Spent = Quantity * Price_Per_Unit
WHERE Total_Spent IS NULL
    
-- Después es necesario eliminar 6 filas restantes para que el precio tenga consistencia con los demás datos. 
DELETE FROM cafe_sales
WHERE Price_Per_Unit IS NULL;
-- Al hacer esto se tiene por ahora en valores Nulos de quantity 0, valores nulos en Price_per_unit 0 y en total_spent 0.
-- 6. Payment_method:
-- Aquí se usa una subconsulta y se rellena los valores nulos con el valor más común(moda).
UPDATE cafe_sales
SET payment_method = (
    SELECT TOP 1 Payment_method
    FROM cafe_sales
    WHERE Payment_method IS NOT NULL
    GROUP BY Payment_method
    ORDER BY COUNT(*) DESC

WHERE payment_method IS NULL;
-- 7. Location:
-- Se rellenan los valores nulos con las 2 posibles opciones que se eligen aleatoriamente: In-store y Takeaway.
UPDATE cafe_sales
SET Location = CASE ABS(CHECKSUM(NEWID())) % 2
    WHEN 0 THEN 'In-store'
    WHEN 1 THEN 'Takeaway'
END
WHERE Location IS NULL;
-- 8.Item: 
-- Se rellenan los valores nulos utilizando de igual forma Self Join. El nombre del producto se colocará en los valores nulos según el precio que tenga en otra fila
-- ese mismo producto. 
UPDATE a
SET a.Item = b.Item
FROM cafe_sales a
JOIN cafe_sales b
    ON a.Price_Per_Unit = b.Price_Per_Unit
WHERE a.Item IS NULL
AND b.Item IS NOT NULL;
-- 9. Transaction_date:
-- Se rellenan los valores nulos con fechas que se generan del año 2023.  
UPDATE cafe_sales
SET transaction_date = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2023-01-01')
WHERE transaction_date IS NULL;
-- El último paso es simplemente realizar nuevamente el conteo de los valores nulos para validar que todo está correcto. 







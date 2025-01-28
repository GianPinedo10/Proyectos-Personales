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
-- 2. Contar valores NULL para saber la cantidad exacta que hay
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
-- 

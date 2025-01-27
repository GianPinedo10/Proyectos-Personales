# Proyecto 3: Limpieza de datos de una Cafetería
## Descripción del Proyecto:
Este proyecto se centró en la limpieza y preparación de datos de un dataset relacionado a las ventas de una cafetería utilizando Microsoft SQL Server. El objetivo principal fue identificar y corregir valores inconsistentes, eliminar datos erróneos, y completar valores faltantes en diversas columnas.
### Antes:

![image](https://github.com/user-attachments/assets/ac119ef8-9321-4fdd-b55c-7f04e1296252)
### Después:
![image](https://github.com/user-attachments/assets/a09b601b-df3f-404b-b6b6-d1838d864517)


## Objetivos Generales
1. Garantizar la calidad de los datos al corregir errores, valores nulos y discrepancias en el dataset. Es un proceso que es muy importante antes de realizar cualquier análisis. 
2. Destacar la importancia de la limpieza en los datos debido a que es una habilidad clave que un analista de datos debe tener.
3. Implementar un flujo de limpieza de datos sólido que minimice el riesgo de resultados incorrectos.
## Dataset
**Fuente**: https://www.kaggle.com/datasets/ahmedmohamed2003/cafe-sales-dirty-data-for-cleaning-training

**Contenido**: El dataset contiene información de las transacciones de una cafetería con las siguientes columnas:
 - **Transaction ID**: Identificador único para cada transacción.
  - **Item**: El nombre del artículo comprado.
  - **Quantity**: La cantidad del artículo comprado.
  - **Price Per Unit**: El precio de una sola unidad del artículo.
  - **Total Spent**: El monto total gastado en una transacción. Se calcula como Quantity * Price Per Unit.
  - **Payment Method**: El método de pago utilizado.
  - **Location**: El lugar donde ocurrió la transacción. 
  - **Transaction Date**: La fecha de la transacción.

## Problemas Identificados
- Había una gran cantidad de valores nulos, además de otros tipos de valores como "ERROR" o "UNKNOWN" en la gran mayoría de columnas del dataset. 
- Antes de realizar la limpieza de los datos, se realizó el conteo de los valores nulos, pero para los valores "ERROR" y "UNKNOWN" no era posible por un problema con el tipo de dato. Por ello, se tuvo que convertir estos valores a nulos y así realizar el conteo de forma completa. 
- Completar los valores nulos en la columna Total_Spent fue posible utilizando los valores de Quantity y Price_Per_Unit mediante la multiplicación de ambas columnas. Sin embargo, esta solución no fue aplicable en todos los casos.
- Al rellenar los valores en los registros nulos, se observó que, en algunos casos, aún quedaban valores nulos después de ejecutar el código. Por lo tanto, fue necesario ejecutar el proceso varias veces más.  
- Después de haber realizado la limpieza en la columna Total_Spent, se eliminaron unos pocos registros para mantener la consistencia de los datos en relación con el precio que tenía cada producto de la cafetería. 

## Lecciones Aprendidas
- Es importante realizar validaciones después de aplicar las transformaciones a los datos, para asegurar de que las modificaciones no hayan introducido nuevos errores o inconsistencias en el dataset. 
- Es posible rellenar algunos datos faltantes según otra fila si se tiene una relación lógica entre ambas utilizando Self Join. 
- Existen diferentes técnicas de limpieza de datos que pueden aplicarse dependiendo del tipo de problema identificado en un dataset. Queda en criterio de uno mismo saber cuál aplicar y que es lo más recomendable en cada situación. 
- La herramienta utilizada para este proyecto fue Microsoft SQL Server, y una vez completado el proceso de limpieza, los datos pueden exportarse a un archivo CSV.


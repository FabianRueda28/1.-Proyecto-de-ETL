# Proyecto Individual 1- Data 04- Soy Henry   
## Data Engineering

# Proceso para realizar un ETL, crear un DB en MySQL y hacer una carga Autoincremental 
En este proceso recibimos datos semiestructurados de tipo Json, Parquet, xlsx y txt, los cuales pasarán por una serie de procesos como transformación y limpieza para despues cargarlos a un DataBase(DB) y crear DataSets donde terminaremos equilibrando los datos, esto con el fin de hacer consultas mas rapidas, con una precición eficaz de los datos y reducción en el tiempo de la optimización del trabajo para futuras tareas. 

En este link pueden ver un video con el trabajo desde 0 con el cual peden llevar seguimiento del proyecto mismo.

# Herramientas
Python
    (Pandas
    -Numpy 
    -openpyxl) 

-MySQL Workbench

# Extracción
Descargamos los datos del siguiente link donde van a poder encontrar los archivos con los que van a trabajar: https://drive.google.com/drive/folders/1Rsq-HHomPtQwy7RIWQ574wKcf56LiGq1?usp=sharing 

Despues que descargamos los datos procedemos a realizar modificaciones dentro de los archivos para trabajar mas comodo y evitar fallas en el proceso de ETL. 

Lo primero que vamos hacer es verificar el archivo .xlsx y veremos que tiene 2 hojas tipo excel separadas, lo que vamos hacer es crear 2 archivos tipo xlsx, uno con cada hoja que estaba dentro del archivo y los renombraremos para trabajar mas comodo los datos.

Vamos a cambiar los nombres de los archivos para recordarlos al momento de empezar a trabajar. 

Nombres nuevos:
precios_semana_20200413.csv -> precios_semana_1.csv
precios_semana_20200503.json -> precios_semana_2.json
precios_semana_20200518.txt -> precios_semana_3.txt
precios_semanas_20200426.xlsx -> precios_semana_4.xlsx
precios_semanas_20200419.xlsx -> precios_semana_5.xlsx
Producto.parquet y sucursales.csv los dejamos con los mismos nombres. 

# Limpieza de datos 
Para ello nos vamos al archivo Transform.ipynb y vemos los pasos que se realizarón para la transformación y limpieza parcial de los datos. 

# Carga en MySQL Workbench
Nos vamos al archivo llamado ETL.sql y lo abrimos.
Dentro del archivo vamos a encontrar los pasos a seguir para la creacion, el uso y el cambio de algunos datos para mejorar la calidad de las busquedas en nuestras tablas. 









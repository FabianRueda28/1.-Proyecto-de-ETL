-- CREAMOS EL DATABASE
create database ETL; 

-- UTILIZAMOS EL DATABASE
use etl;

-- CON ESTE CODIGO BUSCAMOS LA UBICACIÓN A GUARDAR NUESTROS ARCHIVOS PARA PODER SUBIRLOS A MYSQL
SELECT @@global.secure_file_priv; 


-- 1 CREAMOS LA TABLA
DROP TABLE IF EXISTS productos;
CREATE TABLE productos (
	Id_producto varchar(50) not null,
    Marca varchar(50),
    Nombre varchar(300),
    Presentacion varchar(50),
    categoria_1 varchar(50), 
    categoria_2 varchar(50),
    categoria_3 varchar(50),
    primary key (Id_producto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\producto.csv'
INTO TABLE productos
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES; 

-- REEMPLAZAMOS LOS - POR ESPACIOS EN BLANCO EN LA COLUMNA ID_PRODUCTO
update productos set Id_producto = replace(Id_producto, '-', ''); 

-- CONVERTIMOS EL DATO DE ID_PRODUCTO EN BIGINT AUTO_INCREMENT
alter table productos modify Id_producto bigint auto_increment;

-- ELIMINAMOS LAS COLUMNAS QUE NO TENIAN VALORES   
alter table productos drop column Categoria_1; 
alter table productos drop column Categoria_2;
alter table productos drop column Categoria_3;




-- Creamos la tabla de sucursale 
DROP TABLE IF EXISTS sucursales;
CREATE TABLE sucursales (
	Id_sucursal varchar(50),
    Id_comercio int(11),
    Id_bandera int(11),
    Descripcion_bandera varchar(100),
    Comercio_razon_social varchar(100), 
    Provincia varchar(50),
    Localidad varchar(100),
    Direccion varchar(200),
    Latitud varchar(50),
    Longitud varchar(50),
    Nombre_sucursal varchar(50),
    Tipo_sucursal varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sucursal.csv'
INTO TABLE sucursales
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES; 

-- CAMBIAMOS LOS VALORES NEGATIVOS POR POSITIVOS EN LONG Y LAT
ALTER TABLE sucursales 	ADD Latitud_1 DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Longitud, 
						ADD Longitud_1 DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Latitud_1;
                        
-- CREAMOS 2 NUEVAS COLUMNAS A PARTIR DE LAT Y LONG					
UPDATE sucursales SET Latitud_1 = REPLACE(Latitud,'-','');
UPDATE sucursales SET Longitud_1 = REPLACE(Longitud,'-','');  

-- ELIMINAMOS LAS COLUMNAS QUE NO NESCESITAMOS
alter table sucursales drop column Longitud;
alter table sucursales drop column Latitud;
 
 -- CAMBIAMOS NOMBRES DE LAS COLUMNAS LONG Y LAT 
ALTER TABLE sucursales RENAME COLUMN Latitud_1 to Latitud;
ALTER TABLE sucursales RENAME COLUMN Longitud_1 to Longitud;

-- REEMPLAZAMOS LOS - POR ESPACIOS VACIOS EN ID_SUCURSAL
update sucursales set Id_sucursal = replace(Id_sucursal, '-', '');

-- CAMBIAMOS EL TIPO DE DATO DE ID_SUCURSAL A INT
alter table sucursales modify Id_sucursal int;




-- CREAMOS LA TABLA PRECIOS 
DROP TABLE IF EXISTS precios;
CREATE TABLE precios (
	Precio decimal(20,2),
    Producto_id varchar(50),
    Sucursal_id varchar(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_1.csv'
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES; 

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_2.csv'
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_4.csv'
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\precios_semana_5.csv'
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- MODIFICAMOS LOS DATOS DE ID_PRODUCTO
update precios set Producto_id = replace(Producto_id, '-', '');  

-- CAMBIAMOS EL TIPO DE DATO A BIGINT DE ID_PRODUCTO
alter table precios modify Producto_id bigint;

-- ELIMINAMOS LOS - DE LA COLUMNA SUCURSAL_ID
update precios set Sucursal_id = replace(Sucursal_id, '-', '');

-- MODIFICAMOS EL TIPO DE DATO DE LA COLUMNA SUCURSAL_ID A INT
alter table precios modify Sucursal_id int;  

-- CREAMOS UNA FK CON LAS TABLAS PRODUCTOS Y PRECIOS
SET FOREIGN_KEY_CHECKS=0;
alter table precios add constraint precios_productos
foreign key (Producto_id) references productos(Id_producto); 


-- La query a armar es la siguiente: Precio promedio de la sucursal 9-1-688.
select avg(Precio) from precios where Sucursal_id = 91688;


LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\ETL\\precios_semana_3_txt.csv'
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '"' ESCAPED BY ''
LINES TERMINATED BY '\n' IGNORE 1 LINES;










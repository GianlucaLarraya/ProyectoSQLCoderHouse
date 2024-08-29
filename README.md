# ProyectoSQLCoderHouse
* Alumno: Gianluca Larraya
* Comisión: 59410
* Tutor: Nancy Elizabeth Villena Reines
* Docente: Anderson Ocaña

## Temática del proyecto ##
Este proyecto busca mediante una base de datos mejorar la gestion de un showroom de prendas de ropa ¿De qué manera? Llevando un registro del stock de los productos, las ventas, citas (ya que es un showroom con cita previa) y clientes. Además, con el objetivo de recolectar datos verdaderamente útiles para el desarrollo del negocio también se guardaran datos de las consultas hechas por clientes vía redes sociales sobre la disponibilidad de los productos. 

## Diagrama entidad relación (DER) ##
![alt text](https://github.com/GianlucaLarraya/ProyectoSQLCoderHouse/blob/main/ShowroomDatabase.jpeg?raw=true)

## Tablas ##

#### Producto ####
Descripcion: Almacena la informacion del producto
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | id_producto | int | | X | X | AUTO_INCREMENT 

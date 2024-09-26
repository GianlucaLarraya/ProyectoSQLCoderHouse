# ProyectoSQLCoderHouse
* Alumno: Gianluca Larraya
* Comisión: 59410
* Tutor: Nancy Elizabeth Villena Reines
* Docente: Anderson Ocaña

## Temática del proyecto ##
Este proyecto busca mediante una base de datos mejorar la gestion de un showroom de prendas de ropa ¿De qué manera? Llevando un registro del stock de los productos, las ventas, citas (ya que es un showroom con cita previa) y clientes. Además, con el objetivo de recolectar datos verdaderamente útiles para el desarrollo del negocio también se guardaran datos de las consultas hechas por clientes vía redes sociales sobre la disponibilidad de los productos. 

## Diagrama entidad relación (DER) ##
![alt text](https://github.com/GianlucaLarraya/ProyectoSQLCoderHouse/blob/main/finaldiagram.png?raw=true)

## Tablas ##

#### Producto ####
Descripcion: Almacena la informacion básica del producto
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | id_producto | int | | X | X | AUTO_INCREMENT 
| | nombre_producto | varchar | 50 | X | X |  | 
| | talle_producto | varchar | 5 | X |  |  |
| | genero_producto | enum | | X |  |  |'
| | precio_producto | decimal(10,2) | | X |  |  |

#### VarianteProducto ####
Descripcion: Almacena la informacion de la variante del producto.(Ej:Remera Deportiva en talle M)
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | id_variante_producto | int | | X | X | AUTO_INCREMENT 
FK | id_producto | int | | X | X |  
| | color_producto | varchar | 20 | X | X |  | 
| | talle_producto | varchar | 5 | X |  |  |
| | genero_producto | enum | | X |  |  |'


#### Stock ####
Descripcion: Almacena la cantidad disponible de la variante del producto en stock
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK,FK | id_variante_producto | int | | X | X | 
| | cantidad | int | | X |  | 

#### Compra ####
Descripcion: Almacena la informacion de una compra hecha en el Showroom
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | id_compra | int | | X | X | AUTO_INCREMENT 
| | monto_compra | decimal(10,2) |  | X | |  | 
| | fecha_compra | datetime |  | X |  |  |
FK | id_cliente | int |  | X |  |  | 

#### ProductoCompra ####
Descripcion: Almacena las variantes de los productos incluidos a una compra
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | id_producto_compra | int | | X | X | AUTO_INCREMENT 
FK | id_variante_producto | int |  | X |  |  | 
FK | id_compra | int |  | X |  |  |
| | cantidad_producto | int | | X |  | 

#### Consulta ####
Descripcion: Almacena las consultas hechas por usuarios en redes sociales
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | id_consulta | int | | X | X | AUTO_INCREMENT 
FK | id_producto_consulta | int |  | X |  |  | 
 |  | fecha_consulta | datetime |  | X |  |  |

 #### Turno ####
Descripcion: Almacena los turnos para visitar el Showroom
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | id_turno | int | | X | X | AUTO_INCREMENT 
FK | dni_cliente | int |  | X |  |  | 
 |  | fecha_turno | datetime |  | X |  |  |

  #### Cliente ####
Descripcion: Almacena los clientes del Showroom
| Key | Columna | Tipo de dato | Length | Not null | Unique | Default 
| :--- | ---: | :---: | :---: | :---: | :---: | :---: 
PK | dni_cliente | int | | X | X |  
 | | nombre_cliente | varchar | 50 | X |  |  | 
 |  | apellido_cliente | varchar | 50 | X |  |  |
 |  | edad_cliente | int |  | X |  |  |


DROP DATABASE IF EXISTS showroom;
CREATE DATABASE showroom ;
USE showroom;

CREATE TABLE PRODUCTO (
  id_producto int unsigned auto_increment primary key,
  nombre_producto varchar(50) not null,
  talle_producto varchar(5) not null,
  genero_producto ENUM('H', 'M', 'U') not null
  );

CREATE TABLE CLIENTE (
  dni_cliente int unsigned primary key,
  nombre_cliente varchar(50) not null,
  apellido_cliente varchar(50) not null,
  edad_cliente int unsigned);

CREATE TABLE COMPRA (
  id_compra int unsigned auto_increment primary key,
  monto_compra decimal(10,2) not null,
  fecha_compra datetime not null,
  dni_cliente int unsigned,
  FOREIGN KEY(dni_cliente) REFERENCES CLIENTE(dni_cliente)
  );
  
CREATE TABLE TURNO ( 
  id_turno int unsigned auto_increment primary key,
  dni_cliente int unsigned not null,
  fecha_turno date not null,
  FOREIGN KEY(dni_cliente) REFERENCES CLIENTE(dni_cliente)
);

CREATE TABLE CONSULTA (
  id_consulta int unsigned auto_increment primary key,
  id_producto_consulta int unsigned not null,
  fecha_consulta datetime not null,
  FOREIGN KEY(id_producto_consulta) REFERENCES PRODUCTO(id_producto)
);

ALTER TABLE PRODUCTO
ADD COLUMN precio_producto DECIMAL(10,2) NOT NULL;

ALTER TABLE TURNO
MODIFY COLUMN fecha_turno DATETIME NOT NULL;

ALTER TABLE PRODUCTO
DROP COLUMN talle_producto,
DROP COLUMN genero_producto;

CREATE TABLE VARIANTEPRODUCTO (
  id_variante_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  id_producto INT UNSIGNED NOT NULL,
  talle_producto VARCHAR(5),
  color_producto VARCHAR(20),
  genero_producto ENUM('H', 'M', 'U') NOT NULL,
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto)
);

CREATE TABLE STOCK (
    id_variante_producto INT UNSIGNED,
    cantidad INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_variante_producto),
    FOREIGN KEY (id_variante_producto) REFERENCES VARIANTEPRODUCTO(id_variante_producto)
);

CREATE TABLE PRODUCTOCOMPRA (
    id_producto_compra INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_variante_producto INT UNSIGNED NOT NULL,
    id_compra INT UNSIGNED NOT NULL,
    cantidad_producto INT NOT NULL,
    FOREIGN KEY (id_variante_producto) REFERENCES VARIANTEPRODUCTO(id_variante_producto),
    FOREIGN KEY (id_compra) REFERENCES COMPRA(id_compra)
);

-- Creacion vistas

CREATE VIEW VentasPorProducto AS
SELECT p.nombre_producto, SUM(pc.cantidad_producto) AS total_vendido
FROM Producto p
LEFT JOIN VarianteProducto v ON p.id_producto = v.id_producto
LEFT JOIN ProductoCompra pc ON v.id_variante_producto = pc.id_variante_producto
GROUP BY p.nombre_producto;

CREATE VIEW ClientesFrecuentes AS
SELECT c.nombre_cliente as NombreCliente, c.apellido_cliente as ApellidoCliente,
       COUNT(co.id_compra) AS total_compras
FROM Cliente c
JOIN Compra co ON c.dni_cliente = co.dni_cliente
GROUP BY c.dni_cliente
ORDER BY total_compras DESC;

-- Creacion funciones

DROP FUNCTION IF EXISTS check_stock;

DELIMITER //

CREATE FUNCTION check_stock(
    nombre_producto VARCHAR(50),
    talle_producto VARCHAR(5),
    color_producto VARCHAR(20)
)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE stock_disponible INT;

    
    SELECT s.cantidad
    INTO stock_disponible
    FROM PRODUCTO p
    JOIN VARIANTEPRODUCTO v ON p.id_producto = v.id_producto
    JOIN STOCK s ON v.id_variante_producto = s.id_variante_producto
    WHERE LOWER(p.nombre_producto) = LOWER(nombre_producto)
      AND LOWER(v.talle_producto) = LOWER(talle_producto)
      AND LOWER(v.color_producto) = LOWER(color_producto);

    IF stock_disponible > 0 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION talle_mas_vendido(
    nombre_producto VARCHAR(50)
)
RETURNS VARCHAR(5)
DETERMINISTIC
BEGIN
    DECLARE talle_producto VARCHAR(5);

    SELECT v.talle_producto
    INTO talle_producto
    FROM PRODUCTO p
    JOIN VARIANTEPRODUCTO v ON p.id_producto = v.id_producto
    JOIN PRODUCTOCOMPRA pc ON v.id_variante_producto = pc.id_variante_producto
    WHERE LOWER(p.nombre_producto) = LOWER(nombre_producto)
    GROUP BY v.talle_producto
    ORDER BY SUM(pc.cantidad_producto) DESC
    LIMIT 1;

    RETURN talle_producto;
END //

DELIMITER ;

-- Creacion stored procedures

DELIMITER //

CREATE PROCEDURE aumentar_stock(
    IN nombre_producto VARCHAR(50),
    IN talle_producto VARCHAR(5),
    IN color_producto VARCHAR(20),
    IN cantidad_recibida INT
)
BEGIN
    
    UPDATE Stock s
    JOIN VarianteProducto v ON s.id_variante_producto = v.id_variante_producto
    JOIN Producto p ON v.id_producto = p.id_producto
    SET s.cantidad = s.cantidad + cantidad_recibida
    WHERE LOWER(p.nombre_producto) = LOWER(nombre_producto)
      AND LOWER(v.talle_producto) = LOWER(talle_producto)
      AND LOWER(v.color_producto) = LOWER(color_producto);

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto, talle o color no existe';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE listar_productos_stock_bajo(
    IN cantidad_minima INT
)
BEGIN
    
    SELECT p.nombre_producto, v.talle_producto, v.color_producto, s.cantidad AS stock_disponible
    FROM Producto p
    JOIN VarianteProducto v ON p.id_producto = v.id_producto
    JOIN Stock s ON v.id_variante_producto = s.id_variante_producto
    WHERE s.cantidad < cantidad_minima
    ORDER BY s.cantidad ASC;
END //

DELIMITER ;

-- Creacion de triggers 

DROP TRIGGER IF EXISTS reducir_stock;
DELIMITER //

CREATE TRIGGER reducir_stock AFTER INSERT ON ProductoCompra
FOR EACH ROW
BEGIN
    DECLARE nuevo_stock INT;
    
    UPDATE Stock s
    JOIN VarianteProducto v ON s.id_variante_producto = v.id_variante_producto
    SET s.cantidad = s.cantidad - NEW.cantidad_producto
    WHERE v.id_variante_producto = NEW.id_variante_producto;

    
    SELECT s.cantidad INTO nuevo_stock
    FROM Stock s
    WHERE s.id_variante_producto = NEW.id_variante_producto;


    IF nuevo_stock < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Stock insuficiente para completar la compra';
    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER prevenir_turno_duplicado BEFORE INSERT ON Turno
FOR EACH ROW
BEGIN
    
    DECLARE count_turnos INT;

   
    SELECT COUNT(*) INTO count_turnos
    FROM Turno
    WHERE fecha_turno = NEW.fecha_turno;

    
    IF count_turnos > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe un turno en esta fecha y hora';
    END IF;
END //

DELIMITER ;



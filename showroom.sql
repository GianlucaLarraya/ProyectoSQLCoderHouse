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
  
CREATE TABLE STOCK ( 
  id_producto int unsigned primary key,
  cantidad int unsigned not null,
  FOREIGN KEY(id_producto) REFERENCES PRODUCTO(id_producto)
  );

CREATE TABLE COMPRA (
  id_compra int unsigned auto_increment primary key,
  monto_compra decimal(10,2) not null,
  fecha_compra datetime not null,
  dni_cliente int unsigned,
  FOREIGN KEY(dni_cliente) REFERENCES CLIENTE(dni_cliente)
  );
  
CREATE TABLE PRODUCTOCOMPRA ( 
  id_producto_compra int unsigned auto_increment primary key,
  id_producto int unsigned not null,
  id_compra int unsigned not null,
  FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id_producto),
  FOREIGN KEY (id_compra) REFERENCES COMPRA(id_compra)
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

INSERT INTO PRODUCTO (nombre_producto, talle_producto, genero_producto, precio_producto) VALUES
('Camiseta Deportiva', 'M', 'H', 19.99),
('Pantalón Jeans', 'L', 'M', 39.50),
('Zapatos de Cuero', '42', 'H', 85.75),
('Vestido Verano', 'S', 'M', 49.99),
('Cinturón de Piel', 'M', 'U', 15.20),
('Bufanda Lana', 'U', 'U', 12.99),
('Sombrero Fedora', 'M', 'U', 25.00),
('Gorra Beisbol', 'L', 'U', 9.99),
('Sandalias Playa', '39', 'M', 22.50),
('Camisa Formal', 'L', 'H', 35.00),
('Chaqueta Invierno', 'XL', 'H', 120.00),
('Short Deportivo', 'S', 'H', 17.75),
('Traje de Baño', 'M', 'M', 29.90),
('Guantes de Cuero', 'S', 'U', 18.99),
('Medias de Algodón', 'U', 'U', 5.50);

INSERT INTO CLIENTE (dni_cliente, nombre_cliente, apellido_cliente, edad_cliente) VALUES
(12345678, 'Juan', 'Pérez', 32),
(87654321, 'Maria', 'Gonzalez', 28),
(11223344, 'Luis', 'Martínez', 45),
(55667788, 'Ana', 'Lopez', 34),
(99887766, 'Carlos', 'Diaz', 22),
(22334455, 'Lucia', 'Fernandez', 19),
(33445566, 'Pedro', 'Gomez', 40),
(44556677, 'Elena', 'Torres', 27),
(66778899, 'Marta', 'Vazquez', 36),
(77889900, 'Sergio', 'Ramirez', 50);

INSERT INTO STOCK (id_producto, cantidad) VALUES
(1, 50),
(2, 30),
(3, 15),
(4, 20),
(5, 100),
(6, 60),
(7, 25),
(8, 40),
(9, 35),
(10, 10),
(11, 5),
(12, 70),
(13, 80),
(14, 55),
(15, 90);

INSERT INTO COMPRA (monto_compra, fecha_compra, dni_cliente) VALUES
(125.50, '2024-08-01 14:30:00', 12345678),
(99.99, '2024-08-05 10:15:00', 87654321),
(49.90, '2024-08-10 12:00:00', 11223344),
(200.00, '2024-08-11 09:45:00', 55667788),
(89.50, '2024-08-12 18:20:00', 99887766),
(130.75, '2024-08-13 11:00:00', 22334455),
(75.00, '2024-08-14 15:45:00', 33445566),
(150.30, '2024-08-15 13:30:00', 44556677),
(110.00, '2024-08-16 10:10:00', 66778899),
(99.99, '2024-08-17 16:00:00', 77889900);

INSERT INTO PRODUCTOCOMPRA (id_producto, id_compra) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5);

INSERT INTO TURNO (dni_cliente, fecha_turno) VALUES
(12345678, '2024-08-25'),
(87654321, '2024-08-26'),
(11223344, '2024-08-27'),
(55667788, '2024-08-28'),
(99887766, '2024-08-29'),
(22334455, '2024-08-30'),
(33445566, '2024-09-01'),
(44556677, '2024-09-02'),
(66778899, '2024-09-03'),
(77889900, '2024-09-04');

INSERT INTO CONSULTA (id_producto_consulta, fecha_consulta) VALUES
(1, '2024-08-01 14:00:00'),
(7, '2024-08-02 15:30:00'),
(9, '2024-08-03 16:45:00'),
(4, '2024-08-04 17:20:00'),
(3, '2024-08-05 18:00:00'),
(6, '2024-08-06 09:10:00'),
(6, '2024-08-07 10:30:00'),
(8, '2024-08-08 11:15:00'),
(10, '2024-08-09 12:40:00'),
(10, '2024-08-10 13:25:00');

ALTER TABLE TURNO
MODIFY COLUMN fecha_turno DATETIME NOT NULL;

UPDATE TURNO SET fecha_turno = '2024-08-25 14:30:00' WHERE id_turno = 1;
UPDATE TURNO SET fecha_turno = '2024-08-26 09:00:00' WHERE id_turno = 2;
UPDATE TURNO SET fecha_turno = '2024-08-27 10:15:00' WHERE id_turno = 3;
UPDATE TURNO SET fecha_turno = '2024-08-28 13:45:00' WHERE id_turno = 4;
UPDATE TURNO SET fecha_turno = '2024-08-29 08:30:00' WHERE id_turno = 5;
UPDATE TURNO SET fecha_turno = '2024-08-30 11:00:00' WHERE id_turno = 6;
UPDATE TURNO SET fecha_turno = '2024-09-01 15:20:00' WHERE id_turno = 7;
UPDATE TURNO SET fecha_turno = '2024-09-02 17:45:00' WHERE id_turno = 8;
UPDATE TURNO SET fecha_turno = '2024-09-03 09:30:00' WHERE id_turno = 9;
UPDATE TURNO SET fecha_turno = '2024-09-04 12:00:00' WHERE id_turno = 10;

  
  
  
  

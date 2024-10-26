USE showroom;

-- Ingreso Clientes
INSERT INTO CLIENTE(dni_cliente, nombre_cliente, apellido_cliente, edad_cliente) VALUES
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

-- Ingreso Compras
INSERT INTO COMPRA(monto_compra, fecha_compra, dni_cliente) VALUES
(125.50, '2024-08-01 14:30:00', 12345678),
(99.99, '2024-08-05 10:15:00', 87654321),
(49.90, '2024-08-10 12:00:00', 11223344),
(200.00, '2024-08-11 09:45:00', 55667788),
(89.50, '2024-08-12 18:20:00', 99887766),
(130.75, '2024-08-13 11:00:00', 22334455),
(75.00, '2024-08-14 15:45:00', 33445566),
(150.30, '2024-08-15 13:30:00', 44556677),
(110.00, '2024-08-16 10:10:00', 66778899),
(99.99, '2024-08-17 16:00:00', 77889900),
(135.50, '2024-09-01 14:45:00', 12345678);

-- Ingreso Consultas
INSERT INTO CONSULTA(id_producto_consulta, fecha_consulta) VALUES
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

-- Ingreso Productos
INSERT INTO PRODUCTO(nombre_producto, precio_producto) VALUES
('Camiseta Deportiva', 19.99),
('Pantalón Jeans', 39.50),
('Zapatos de Cuero', 85.75),
('Vestido Verano', 49.99),
('Cinturón de Piel', 15.20),
('Bufanda Lana', 12.99),
('Sombrero Fedora', 25.00),
('Gorra Beisbol', 9.99),
('Sandalias Playa', 22.50),
('Camisa Formal', 35.00),
('Chaqueta Invierno', 120.00),
('Short Deportivo', 17.75),
('Traje de Baño', 29.90),
('Guantes de Cuero', 18.99),
('Medias de Algodón', 5.50);

-- Ingreso ProductoCompra
INSERT INTO PRODUCTOCOMPRA(id_producto_compra, id_variante_producto, id_compra, cantidad_producto) VALUES
(42, 1, 1, 2),
(43, 3, 1, 1),
(44, 4, 2, 1),
(45, 8, 2, 2),
(46, 6, 3, 1),
(47, 10, 3, 1),
(48, 12, 4, 3),
(49, 15, 4, 1),
(50, 5, 5, 2),
(51, 13, 5, 1),
(52, 14, 6, 1),
(53, 7, 6, 1),
(54, 9, 7, 1),
(55, 11, 7, 2),
(56, 2, 8, 3),
(57, 15, 8, 1),
(58, 14, 9, 1),
(59, 5, 9, 1),
(60, 7, 10, 1),
(61, 12, 10, 1),
(62, 1, 11, 2),
(63, 4, 11, 1);

-- Ingreso Stock 
INSERT INTO STOCK(id_variante_producto, cantidad) VALUES
(1, 50),
(2, 30),
(3, 20),
(4, 40),
(5, 25),
(6, 15),
(7, 10),
(8, 12),
(9, 5),
(10, 30),
(11, 40),
(12, 25),
(13, 60),
(14, 55),
(15, 100),
(16, 80),
(17, 35),
(18, 20),
(19, 50),
(20, 45),
(21, 60),
(22, 55),
(23, 35),
(24, 20),
(25, 40),
(26, 15),
(27, 10),
(28, 70),
(29, 65),
(30, 55);

-- Ingreso Turnos

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

-- Ingreso Variantes de los productos 
INSERT INTO VARIANTEPRODUCTO(id_variante_producto, id_producto, talle_producto, color_producto, genero_producto) VALUES
(1, 6, 'U', 'Azul', 'U'),
(14, 5, 'M', 'Marrón', 'U'),
(15, 5, 'L', 'Negro', 'U'),
(16, 6, 'U', 'Gris', 'U'),
(17, 6, 'U', 'Negro', 'U'),
(18, 7, 'M', 'Negro', 'U'),
(19, 7, 'L', 'Marrón', 'U'),
(20, 8, 'M', 'Blanco', 'U'),
(21, 8, 'L', 'Negro', 'U'),
(5, 2, 'M', 'Azul', 'M'),
(6, 2, 'L', 'Negro', 'M'),
(7, 2, 'XL', 'Gris', 'M'),
(11, 4, 'S', 'Rojo', 'M'),
(12, 4, 'M', 'Azul', 'M'),
(13, 4, 'L', 'Verde', 'M'),
(22, 9, '39', 'Azul', 'M'),
(23, 9, '40', 'Negro', 'M'),
(2, 1, 'S', 'Rojo', 'H'),
(3, 1, 'M', 'Azul', 'H'),
(4, 1, 'L', 'Negro', 'H'),
(8, 3, '41', 'Marrón', 'H'),
(9, 3, '42', 'Negro', 'H'),
(10, 3, '43', 'Marrón', 'H'),
(24, 10, 'L', 'Blanco', 'H'),
(25, 10, 'M', 'Azul', 'H'),
(26, 10, 'L', 'Negro', 'H'),
(27, 11, 'L', 'Gris', 'H'),
(28, 11, 'XL', 'Negro', 'H'),
(29, 12, 'S', 'Rojo', 'H'),
(30, 12, 'M', 'Azul', 'H'),
(31, 12, 'L', 'Verde', 'H');


INSERT INTO CLIENTE(dni_cliente, nombre_cliente, apellido_cliente, edad_cliente) VALUES
(33442211, 'Javier', 'Rodriguez', 38),
(22113344, 'Sofia', 'Núñez', 24),
(55667799, 'Laura', 'Blanco', 31),
(99886677, 'Alberto', 'Castro', 48),
(12344321, 'Natalia', 'Molina', 29),
(87665432, 'Miguel', 'Ortega', 33);

INSERT INTO COMPRA(monto_compra, fecha_compra, dni_cliente) VALUES
(85.00, '2024-09-05 11:00:00', 33442211),
(200.75, '2024-09-06 16:30:00', 22113344),
(49.90, '2024-09-07 14:20:00', 55667799),
(99.50, '2024-09-08 18:45:00', 99886677),
(60.00, '2024-09-09 12:10:00', 12344321),
(150.00, '2024-09-10 09:00:00', 87665432);

INSERT INTO CONSULTA(id_producto_consulta, fecha_consulta) VALUES
(2, '2024-09-01 15:10:00'),
(3, '2024-09-02 16:30:00'),
(8, '2024-09-03 10:00:00'),
(5, '2024-09-04 12:15:00'),
(10, '2024-09-05 09:45:00'),
(6, '2024-09-06 11:30:00');

INSERT INTO PRODUCTO(nombre_producto, precio_producto) VALUES
('Blazer Casual', 89.99),
('Zapatos Deportivos', 69.50),
('Chaleco de Piel', 55.75),
('Falda Plisada', 39.99),
('Camiseta Básica', 12.50),
('Abrigo Largo', 150.20);

INSERT INTO VARIANTEPRODUCTO(id_variante_producto, id_producto, talle_producto, color_producto, genero_producto) VALUES
(32, 16, 'M', 'Negro', 'M'),
(33, 17, 'L', 'Blanco', 'M'),
(34, 18, 'U', 'Marrón', 'U'),
(35, 19, 'S', 'Rojo', 'U'),
(36, 20, 'M', 'Gris', 'U'),
(37, 21, 'L', 'Azul', 'U');

INSERT INTO STOCK(id_variante_producto, cantidad) VALUES
(32, 25),
(33, 30),
(34, 15),
(35, 20),
(36, 40),
(37, 10);

INSERT INTO PRODUCTOCOMPRA(id_producto_compra, id_variante_producto, id_compra, cantidad_producto) VALUES
(64, 32, 12, 1),
(65, 33, 13, 2),
(66, 34, 14, 1),
(67, 35, 15, 1),
(68, 36, 16, 3),
(69, 37, 17, 2);

INSERT INTO TURNO (dni_cliente, fecha_turno) VALUES
(33442211, '2024-09-05 10:00:00'),
(22113344, '2024-09-06 15:00:00'),
(55667799, '2024-09-07 09:00:00'),
(99886677, '2024-09-08 11:30:00'),
(12344321, '2024-09-09 13:00:00'),
(87665432, '2024-09-10 14:00:00');

INSERT INTO COMPRA(monto_compra, fecha_compra, dni_cliente) VALUES
(150.00, '2024-01-15 10:30:00', 12345678),
(89.99, '2024-02-12 12:00:00', 87654321),
(200.50, '2024-03-18 14:15:00', 11223344),
(75.25, '2024-04-22 11:45:00', 55667788),
(130.75, '2024-05-19 09:10:00', 99887766),
(99.99, '2024-06-05 15:00:00', 22334455),
(165.40, '2024-07-23 17:25:00', 33445566),
(215.60, '2024-08-14 13:00:00', 44556677),
(185.75, '2024-09-10 16:20:00', 66778899),
(140.00, '2024-10-03 10:00:00', 77889900),
(180.30, '2024-11-27 11:30:00', 33442211),
(120.50, '2024-12-20 14:45:00', 22113344);

INSERT INTO PRODUCTOCOMPRA(id_variante_producto, id_compra, cantidad_producto) VALUES
(1, 18, 2), 
(3, 19, 1),  
(5, 20, 3),  
(7, 21, 1),  
(9, 22, 2),  
(11, 23, 1), 
(13, 24, 1), 
(15, 25, 2), 
(17, 26, 1), 
(19, 27, 1), 
(21, 28, 2), 
(23, 29, 1); 



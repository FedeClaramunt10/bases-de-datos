CREATE DATABASE IF NOT EXISTS hotel;
USE hotel;

CREATE TABLE IF NOT EXISTS habitaciones (
    id_habitacion INT AUTO_INCREMENT PRIMARY KEY,
    numero_habitacion VARCHAR(10) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    precio_por_noche DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(20) NOT NULL);

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion TEXT);

CREATE TABLE IF NOT EXISTS reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_habitacion INT,
    fecha_entrada DATE NOT NULL,
    fecha_salida DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion));


CREATE TABLE IF NOT EXISTS pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    monto DECIMAL(10, 2) NOT NULL,
    fecha_pago DATE NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);

INSERT INTO habitaciones (numero_habitacion, tipo, precio_por_noche, estado)
VALUES
('101', 'Individual', 50.00, 'Disponible'),
('102', 'Doble', 75.00, 'Disponible'),
('103', 'Suite', 150.00, 'Ocupada'),
('104', 'Individual', 50.00, 'Disponible'),
('105', 'Doble', 75.00, 'Mantenimiento'),
('106', 'Suite', 150.00, 'Disponible'),
('107', 'Individual', 50.00, 'Ocupada'),
('108', 'Doble', 75.00, 'Disponible'),
('109', 'Suite', 150.00, 'Disponible'),
('110', 'Individual', 50.00, 'Disponible'),
('111', 'Doble', 75.00, 'Disponible'),
('112', 'Suite', 150.00, 'Ocupada'),
('113', 'Individual', 50.00, 'Disponible'),
('114', 'Doble', 75.00, 'Disponible'),
('115', 'Suite', 150.00, 'Ocupada');


INSERT INTO clientes (nombre, telefono, email, direccion)
VALUES
('Carlos Pérez', '555-1234', 'carlos@example.com', 'Calle 1, Ciudad A'),
('Lucía Gómez', '555-5678', 'lucia@example.com', 'Calle 2, Ciudad B'),
('Martín González', '555-8765', 'martin@example.com', 'Calle 3, Ciudad C'),
('Ana López', '555-4321', 'ana@example.com', 'Calle 4, Ciudad A'),
('Pedro Jiménez', '555-2222', 'pedro@example.com', 'Calle 5, Ciudad D'),
('Laura Rodríguez', '555-3333', 'laura@example.com', 'Calle 6, Ciudad B'),
('Javier Morales', '555-4444', 'javier@example.com', 'Calle 7, Ciudad A'),
('Sofía Díaz', '555-5555', 'sofia@example.com', 'Calle 8, Ciudad E'),
('Luis Martínez', '555-6666', 'luis@example.com', 'Calle 9, Ciudad D'),
('Gloria Rivera', '555-7777', 'gloria@example.com', 'Calle 10, Ciudad C'),
('Roberto Torres', '555-8888', 'roberto@example.com', 'Calle 11, Ciudad A'),
('Isabel Sánchez', '555-9999', 'isabel@example.com', 'Calle 12, Ciudad E'),
('Fernando Flores', '555-1010', 'fernando@example.com', 'Calle 13, Ciudad F'),
('Marta Hernández', '555-1212', 'marta@example.com', 'Calle 14, Ciudad C'),
('Diego Ramos', '555-1313', 'diego@example.com', 'Calle 15, Ciudad A');


INSERT INTO reservas (id_cliente, id_habitacion, fecha_entrada, fecha_salida, estado)
VALUES
(1, 1, '2024-10-01', '2024-10-05', 'Confirmada'),
(2, 2, '2024-10-03', '2024-10-07', 'Cancelada'),
(3, 3, '2024-10-05', '2024-10-10', 'Confirmada'),
(4, 4, '2024-10-02', '2024-10-06', 'Pendiente'),
(5, 5, '2024-10-06', '2024-10-09', 'Confirmada'),
(6, 6, '2024-10-07', '2024-10-12', 'Pendiente'),
(7, 7, '2024-10-04', '2024-10-09', 'Confirmada'),
(8, 8, '2024-10-08', '2024-10-13', 'Confirmada'),
(9, 9, '2024-10-10', '2024-10-14', 'Pendiente'),
(10, 10, '2024-10-11', '2024-10-15', 'Confirmada'),
(11, 11, '2024-10-12', '2024-10-16', 'Pendiente'),
(12, 12, '2024-10-13', '2024-10-18', 'Cancelada'),
(13, 13, '2024-10-14', '2024-10-19', 'Confirmada'),
(14, 14, '2024-10-15', '2024-10-20', 'Confirmada'),
(15, 15, '2024-10-16', '2024-10-21', 'Pendiente');


INSERT INTO pagos (id_reserva, monto, fecha_pago, metodo_pago)
VALUES
(1, 250.00, '2024-10-05', 'Tarjeta de Crédito'),
(2, 300.00, '2024-10-07', 'Efectivo'),
(3, 750.00, '2024-10-10', 'PayPal'),
(4, 200.00, '2024-10-06', 'Tarjeta de Crédito'),
(5, 225.00, '2024-10-09', 'Efectivo'),
(6, 600.00, '2024-10-12', 'PayPal'),
(7, 250.00, '2024-10-09', 'Tarjeta de Crédito'),
(8, 375.00, '2024-10-13', 'Efectivo'),
(9, 600.00, '2024-10-14', 'PayPal'),
(10, 300.00, '2024-10-15', 'Tarjeta de Crédito'),
(11, 375.00, '2024-10-16', 'Efectivo'),
(12, 750.00, '2024-10-18', 'PayPal'),
(13, 600.00, '2024-10-19', 'Tarjeta de Crédito'),
(14, 750.00, '2024-10-20', 'Efectivo'),
(15, 900.00, '2024-10-21', 'PayPal');


-- • Reservas con nombre del cliente y número de habitación.
-- Mostrar todas las reservas con el nombre completo del cliente y el número de la
-- habitación reservada
SELECT r.id_reserva,
    c.nombre AS nombre_cliente,
    h.numero_habitacion
FROM reservas r
JOIN clientes c ON r.id_cliente = c.id_cliente
JOIN habitaciones h ON r.id_habitacion = h.id_habitacion;
    
-- • Pagos con nombre del cliente y monto pagado.
-- Listar todos los pagos realizados junto al nombre del cliente correspondiente y el monto.
SELECT p.id_pago,
	c.nombre AS nombre_cliente,
    p.monto
FROM pagos p
JOIN reservas r ON p.id_reserva = r.id_reserva
JOIN clientes c ON r.id_cliente = c.id_cliente;

-- • Habitaciones ocupadas y nombre del cliente.
-- Mostrar las habitaciones actualmente ocupadas junto con el nombre del cliente que las
-- reservó.
SELECT h.numero_habitacion,
	c.nombre AS nombre_cliente
FROM habitaciones h
JOIN reservas r ON h.id_habitacion = r.id_habitacion
JOIN clientes c ON r.id_cliente = c.id_cliente
WHERE h.estado = 'Ocupada';  

-- • Clientes y sus reservas (si las tienen).
-- Incluir también a los clientes que no hayan realizado ninguna reserva. Usar LEFT JOIN.
SELECT c.id_cliente,
	c.nombre AS nombre_cliente,
    r.id_reserva,
    r.fecha_entrada,
    r.fecha_salida,
    r.estado AS estado_reserva
FROM clientes c
LEFT JOIN reservas r ON c.id_cliente = r.id_cliente;

-- • Clientes sin reservas.
-- Mostrar únicamente los clientes que no tienen ninguna reserva asociada.
SELECT c.id_cliente,
	c.nombre AS nombre_cliente,
    c.telefono,
    c.email,
    c.direccion
FROM clientes c
LEFT JOIN reservas r ON c.id_cliente = r.id_cliente
WHERE r.id_reserva IS NULL;

-- • Reservas canceladas con cliente y número de habitación.
-- Listar todas las reservas canceladas, indicando el nombre del cliente y el número de
-- habitación.
SELECT r.id_reserva,
	c.nombre AS nombre_cliente,
	h.numero_habitacion,
	r.fecha_entrada,
	r.fecha_salida
FROM reservas r
JOIN clientes c ON r.id_cliente = c.id_cliente
JOIN habitaciones h ON r.id_habitacion = h.id_habitacion
WHERE r.estado = 'Cancelada';

-- • Habitaciones sin reservas.
-- Mostrar todas las habitaciones que no están asociadas a ninguna reserva.
SELECT h.id_habitacion,
	h.numero_habitacion,
    h.tipo, h.precio_por_noche,
    h.estado
FROM habitaciones h
LEFT JOIN reservas r ON h.id_habitacion = r.id_habitacion
WHERE r.id_reserva IS NULL;

-- • Pagos con tipo de habitación y cliente.
-- Listar los pagos realizados junto con el tipo de habitación y el nombre del cliente.
SELECT c.nombre AS nombre_cliente,
    h.tipo AS tipo_habitacion,
    p.monto,
    p.fecha_pago,
    p.metodo_pago
FROM pagos p
JOIN reservas r ON p.id_reserva = r.id_reserva
JOIN habitaciones h ON r.id_habitacion = h.id_habitacion
JOIN clientes c ON r.id_cliente = c.id_cliente;

-- • Monto total pagado por cada reserva.
-- Agrupar por reserva y mostrar el total pagado.
SELECT id_reserva,
	SUM(monto) AS total_pagado
FROM pagos
GROUP BY id_reserva;

-- • Cantidad de reservas por habitación.
-- Mostrar cuántas veces ha sido reservada cada habitación.
SELECT habitaciones.numero_habitacion,
	COUNT(reservas.id_reserva) AS cantidad_reservas
FROM habitaciones
LEFT JOIN reservas ON habitaciones.id_habitacion = reservas.id_habitacion
GROUP BY habitaciones.numero_habitacion;



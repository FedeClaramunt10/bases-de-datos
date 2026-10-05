CREATE DATABASE CitasMedicas;
USE CitasMedicas;

-- CREAMOS LA TABLA PACIENTE
CREATE TABLE paciente
	(NroObraSocial INT PRIMARY KEY,
	NombreCompleto VARCHAR(50) NOT NULL,
	FechaNacimiento DATE,
	Direccion VARCHAR(60),
	Telefono VARCHAR(25)
	);
    
-- CREAMOS LA TABLA MEDICO
CREATE TABLE medico
	(LicenciaMedica VARCHAR(25) PRIMARY KEY,
    Nombre VARCHAR(30),
    Apellido VARCHAR(50),
    Especialidad VARCHAR(30),
    Telefono VARCHAR(25)    
    );    

-- CREAMOS LA TABLA MEDICOS
CREATE TABLE medico
	(LicenciaMedica VARCHAR(25) PRIMARY KEY,
    Nombre VARCHAR(30),
    Apellido VARCHAR(50),
    Especialidad VARCHAR(30),
    Telefono VARCHAR(25)    
    );
    
-- CRTEAMOS LA TABLA CITA
CREATE TABLE cita
	(IdCita INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Fecha DATE,
    Hora TIME,
    Motivo VARCHAR(30),
    Estado VARCHAR(30),
    Nro_Obra_Social INT,
    Licencia_Medica VARCHAR(25),
    FOREIGN KEY (Nro_Obra_Social) REFERENCES paciente(NroObraSocial),
    FOREIGN KEY (Licencia_Medica) REFERENCES medico(LicenciaMedica)
    );
    
-- CREAMOS LA TABLA TRATAMIENTO
CREATE TABLE tratamiento
	(IdTratamiento INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Nombre VARCHAR(30)
    );
    
-- CREAMOS LA TABLA CITATRATAMIENTO
CREATE TABLE citaTratamiento
	(IdCita INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Id_Tratamiento INT,
    Descripcion VARCHAR(100),
    Duracion INT, -- este deberia ser un TIME
    Id_Cita INT,
    FOREIGN KEY (Id_Tratamiento) REFERENCES tratamiento(IdTratamiento));
    

--  CARGAMOS LAS FILAS DE LA TABLA PACIENTES
-- Incluir al menos un paciente cuyo número de obra social comience con 123.
INSERT INTO paciente (NroObraSocial, NombreCompleto, FechaNacimiento, Direccion, Telefono) VALUES
(1230, 'Martín Pérez', '1991-12-18', 'Av. Rivadavia 4521, CABA', '11234589'), -- paciente con numero de obra social que comience con 123
(1002, 'Lucía Fernández', '1985-06-22', 'Calle 9 N° 123, La Plata', 14567890),
(1003, 'Carlos Domínguez', '1978-11-02', 'San Martín 1050, Córdoba', 35112345),
(1004, 'Mariana Torres', '1995-01-30', 'Mitre 234, Rosario', 34876543),
(1005, 'Alejandro Ruiz', '1988-07-19', 'Av. Colón 345, Mendoza', 26334556),
(1006, 'Florencia Gómez', '1992-04-08', 'Belgrano 890, Salta', 38755668),
(1007, 'Julián Soto', '2000-12-11', 'San Juan 777, Tucumán', 38166789),
(1008, 'Camila Vargas', '1999-09-25', 'Alsina 620, Mar del Plata', 22455667),
(1009, 'Ramiro Acosta', '1983-05-17', 'Urquiza 1450, Santa Fe', 34277990),
(1010, 'Valentina Herrera', '1997-10-03', 'Corrientes 3300, CABA', 11344556);

-- CREAMOS LAS FILAS DE LA TABLA MEDICO
-- Incluir al menos:
-- 		o Un médico con apellido Pérez.
-- 		o Un médico con especialidad Cardiología.
-- 		• Incluir médicos con especialidades: Oftalmología, Cardiología, Dermatología,Endocrinología, Clínica General
INSERT INTO medico(LicenciaMedica, Nombre, Apellido, Especialidad, Telefono) VALUES
('ML001', 'Carlos', 'Pérez', 'Cardiología', '1123456789'), -- medico con apellido Pérez y especialidad cardiología
('CD002', 'María', 'Gómez', 'Clínica General', '113456789'),
('AD003', 'Juan', 'López', 'Endocrinología', '1145678901'),
('TR004', 'Laura', 'Martínez', 'Dermatología', '1156789012'),
('QE005', 'Andrés', 'Fernández', 'Clínica General', '1167890123'),
('JK006', 'Lucía', 'Rodríguez', 'Oftalmología', '1178901234'),
('LK007', 'Pedro', 'Sánchez', 'Endocrinología', '1189012345'),
('FD008', 'Ana', 'Ramírez', 'Cardiología', '1190123456'), -- medico con especialidad cardiología
('QW009', 'Miguel', 'Torres', 'Dermatología', '1101234567'),
('HG010', 'Sofía', 'Díaz', 'Oftalmología', '1112345678');

-- CREAMOS LAS FILAS DE LA TABLA TRATAMIENTO
-- Tratamientos (usar estos valores): Fisioterapia, Antibióticos, Cirugía ambulatoria, Vacunación, Control de hipertensión
INSERT INTO tratamiento(Nombre) VALUES
('Fisioterapia'),
('Antibióticos'),
('Cirugía ambulatoria'),
('Vacunación'),
('Control de hipertensión');


-- CREMOS LAS FILAS DE LA TABLA CITAS
INSERT INTO cita (Fecha, Hora, Motivo, Estado, Nro_Obra_Social, Licencia_Medica) VALUES
('2025-06-01', '09:00:00', 'Consulta general', 'Programada', 1002, 'CD002'),
('2025-02-01', '10:30:00', 'Chequeo cardíaco', 'Completada', 1003, 'FD008'),
('2025-08-02', '08:45:00', 'Control de azúcar', 'Cancelada por el paciente', 1004, 'AD003'),
('2025-04-03', '11:00:00', 'Consulta dermatológica', 'No asistida', 1005, 'QW009'),
('2025-01-04', '14:15:00', 'Revisión oftalmológica', 'Reprogramada', 1006, 'HG010'),
('2025-02-05', '13:00:00', 'Control de presión', 'En proceso', 1007, 'ML001'),
('2025-05-06', '15:30:00', 'Consulta general', 'Cancelada por el médico', 1008, 'QE005'),
('2025-04-07', '09:30:00', 'Consulta endocrina', 'Programada', 1009, 'LK007'),
('2025-04-08', '16:00:00', 'Consulta dermatológica', 'Completada', 1010, 'TR004'),
('2025-08-09', '08:00:00', 'Chequeo visual', 'Programada', 1230, 'JK006'),
('2025-02-10', '10:00:00', 'Control tiroides', 'Programada', 1002, 'AD003'),
('2025-03-11', '11:30:00', 'Consulta clínica general', 'Completada', 1003, 'QE005'),
('2025-07-11', '12:00:00', 'Chequeo cardíaco', 'Cancelada por el médico', 1004, 'FD008'),
('2025-07-12', '08:15:00', 'Consulta dermatológica', 'En proceso', 1005, 'QW009'),
('2025-11-13', '09:45:00', 'Control endocrinológico', 'Completada', 1006, 'LK007'),
('2025-11-13', '10:45:00', 'Chequeo oftalmológico', 'Reprogramada', 1007, 'JK006'),
('2025-12-14', '13:15:00', 'Chequeo clínico', 'No asistida', 1008, 'CD002'),
('2025-06-15', '15:00:00', 'Consulta cardiológica', 'Programada', 1009, 'ML001'),
('2025-03-16', '11:15:00', 'Consulta dermatológica', 'Completada', 1010, 'TR004'),
('2025-05-17', '14:00:00', 'Consulta oftalmológica', 'Cancelada por el paciente', 1230, 'HG010');


-- CREAMOS LAS FILAS DE LA TABLA CITATRAMIENTO
INSERT INTO citaTratamiento(Id_Tratamiento, Descripcion, Duracion, Id_Cita) VALUES
(5, 'Control de presión de rutina', 30, 4),
(1, 'Fisioterapia cervical', 12, 7),
(2, 'Tratamiento antibiótico para faringitis', 5, 9),
(3, 'Cirugía ambulatoria de lunares', 2, 10),
(4, 'Aplicación de vacuna antitetánica', 1, 12),
(5, 'Control de hipertensión arterial', 45, 15),
(2, 'Antibiótico por infección en piel', 7, 17),
(1, 'Fisioterapia de rodilla', 20, 18),
(3, 'Extracción de quiste ambulatoria', 4, 19),
(4, 'Refuerzo vacuna COVID-19', 1, 20),
(1, 'Sesión de fisioterapia lumbar', 10, 1),
(2, 'Antibióticos para infección urinaria', 7, 2),
(5, 'Control presión arterial alta', 30, 6),
(4, 'Vacunación contra gripe', 1, 5),
(3, 'Cirugía ambulatoria menor', 3, 3),
(1, 'Fisioterapia post operatoria', 15, 11),
(5, 'Monitoreo hipertensión', 60, 13),
(4, 'Vacunación esquema completo', 3, 8),
(2, 'Antibióticos para bronquitis', 10, 14),
(3, 'Cirugía ambulatoria de quiste', 5, 16);    
    
    
-- Escribir las sentencias en SQL para las siguientes consultas:
-- a) Listar todos los pacientes.  
SELECT * FROM paciente;

-- b) Listar nombre, apellido y fechas de las citas de pacientes con estado "Programada"
SELECT p.NombreCompleto, c.Fecha
FROM paciente p
JOIN cita c ON p.NroObraSocial = c.Nro_Obra_Social
WHERE c.Estado = 'Programada';    

-- c) Listar nombre y apellido de pacientes cuyo número de seguro social comienza con ‘123’.
SELECT NombreCompleto
FROM paciente
WHERE NroObraSocial LIKE '123%';

-- d) Listar todas las citas completadas en el último mes.
SELECT * FROM cita
WHERE Estado = 'Completada' AND Fecha BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE();

-- e) Listar nombre y apellido de médicos cuya especialidad sea “Cardiología”.
SELECT Nombre, Apellido
FROM medico
WHERE Especialidad = 'Cardiología';

-- f) Listar toda la información de los médicos.
SELECT * FROM medico;

-- g) Listar todas las citas atendidas por el Dr. Pérez.
SELECT c.*
FROM cita c
JOIN medico m ON c.Licencia_Medica = m.LicenciaMedica
WHERE m.Apellido = 'Pérez' AND c.Estado = 'Completada';

-- h) Listar todas las citas atendidas por el Dr. Pérez que incluyeron tratamientos.
SELECT c.*, ct.Descripcion, ct.Duracion, t.Nombre AS Tratamiento
FROM cita c
JOIN medico m ON c.Licencia_Medica = m.LicenciaMedica
JOIN citaTratamiento ct ON c.IdCita = ct.Id_Cita
JOIN tratamiento t ON ct.Id_Tratamiento = t.IdTratamiento
WHERE m.Apellido = 'Pérez' AND c.Estado = 'Completada';

-- i) Obtener el total de citas por paciente y mostrar solo aquellos que tuvieron más de 3 citas.
SELECT p.NombreCompleto, COUNT(c.IdCita) AS TotalCitas
FROM cita c
JOIN paciente p ON c.Nro_Obra_Social = p.NroObraSocial
GROUP BY p.NroObraSocial, p.NombreCompleto
HAVING COUNT(c.IdCita) > 3;

-- j) Mostrar las citas entre ‘2025-01-01’ y ‘2025-05-25’.
SELECT *
FROM cita
WHERE Fecha BETWEEN '2025-01-01' AND '2025-05-25';

-- k) Listar nombre y especialidad de los médicos con más de 5 citas completadas.
SELECT m.Nombre, m.Especialidad, COUNT(*) AS CantidadCitas
FROM medico m
JOIN cita c ON m.LicenciaMedica = c.Licencia_Medica
WHERE c.Estado = 'Completada'
GROUP BY m.LicenciaMedica, m.Nombre, m.Especialidad
HAVING COUNT(*) > 5;

-- m) ¿Cuántas citas fueron canceladas? (considerar ambos tipos de cancelación)
SELECT COUNT(*) AS TotalCanceladas
FROM cita
WHERE Estado IN ('Cancelada por el paciente', 'Cancelada por el médico'); 

-- n) Mostrar el nombre del médico y cantidad de citas que atendió.
SELECT m.Nombre, m.Apellido, COUNT(c.IdCita) AS CantidadCitas
FROM medico m
JOIN cita c ON m.LicenciaMedica = c.Licencia_Medica
GROUP BY m.LicenciaMedica, m.Nombre, m.Apellido;

-- l) Obtener el promedio de duración de todos los tratamientos.
SELECT AVG(Duracion) AS PromedioDuracionDias
FROM citaTratamiento;







    
    
    
    
    
    
    
    
    
    
    
    
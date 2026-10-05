CREATE DATABASE transporte;

CREATE TABLE bronze_viajes (
 id_viaje VARCHAR(36),
 linea VARCHAR(10),
 ramal VARCHAR(10),
 fecha DATE,
 hora TIME,
 origen VARCHAR(100),
 destino VARCHAR(100),
 pasajeros INT,
 recaudacion DECIMAL(10,2)
);

-- 2. Capa Silver – Limpieza y transformación
CREATE TABLE silver_viajes AS
SELECT
    id_viaje,
    UPPER(linea) AS linea,
    IFNULL(NULLIF(TRIM(ramal), ''), 'Desconocido') AS ramal,
    fecha,
    hora,
    origen,
    destino,
    IFNULL(pasajeros, 0) AS pasajeros,
    IFNULL(recaudacion, 0) AS recaudacion,
    CONCAT(origen, ' - ', destino) AS trayecto
FROM
    bronze_viajes;
    
    
    
-- 3. Capa Gold – Datos analíticos
CREATE TABLE gold_analisis_viajes AS
SELECT
    linea,
    ramal,
    COUNT(*) AS cantidad_viajes,
    SUM(pasajeros) AS total_pasajeros,
    SUM(recaudacion) AS total_recaudacion,
    AVG(pasajeros) AS promedio_pasajeros,
    ROUND(AVG(recaudacion), 2) AS promedio_recaudacion  -- Redondea a 2 decimales
FROM
    silver_viajes
GROUP BY
    linea,
    ramal;


-- 4. Análisis e inferencias

-- ¿Cuál es la línea que más pasajeros transportó en total?
SELECT linea FROM gold_analisis_viajes ORDER BY total_pasajeros DESC LIMIT 1;

-- ¿Qué línea tiene mayor recaudación promedio por viaje?
SELECT linea FROM gold_analisis_viajes ORDER BY promedio_recaudacion DESC LIMIT 1;

-- ¿Qué trayectos (origen - destino) son los más recorridos?
SELECT trayecto, COUNT(*) AS cantidad_viajes FROM silver_viajes GROUP BY trayecto ORDER BY cantidad_viajes DESC LIMIT 10;

-- ¿Cuál es el día con más cantidad de viajes realizados?
SELECT fecha, COUNT(*) AS cantidad_viajes FROM silver_viajes GROUP BY fecha ORDER BY cantidad_viajes DESC LIMIT 1;

-- ¿Qué porcentaje de viajes tuvo recaudación igual a cero?
SELECT (SUM(CASE WHEN recaudacion = 0 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS porcentaje_cero_recaudacion FROM silver_viajes;







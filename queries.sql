-- Database: database

-- DROP DATABASE IF EXISTS database;
-- DROP TABLE my_points;

-- -- Step 1: Create table for points
-- CREATE TEMP TABLE my_points (geom geometry);

-- INSERT INTO my_points (geom) VALUES
--   ('POINT(-118.28264336622074 34.01700131684765)'),
--   ('POINT(-118.28311082321726 34.01941930365084)'),
--   ('POINT(-118.28513450000275 34.020227780597395)'),
--   ('POINT(-118.28550932241795 34.0204314105591)'),
--   ('POINT(-118.28726174006398 34.024933964560226)'),
--   ('POINT(-118.28530149797905 34.025389765836394)'),
--   ('POINT(-118.28255421376139 34.021356318061926)'),
--   ('POINT(-118.2832722280872 34.02136598257189)'),
--   ('POINT(-118.28560721635613 34.01979117949461)'),
--   ('POINT(-118.28667453975888 34.02002051629859)'),
--   ('POINT(-118.28723739747706 34.02024317452357)'),
--   ('POINT(-118.2880169064912 34.020142742607554)'),
--   ('POINT(-118.29699421393713 34.023621064714085)');  

-- -- Convex Full
-- SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) AS convex_hull
-- FROM my_points;

-- Nearest Neighbors
SELECT ST_AsText(geom)
FROM (
    SELECT geom, ST_Distance(ST_SetSRID(geom, 4326), ST_SetSRID(ST_Point(-118.289, 34.022), 4326)) as distance
    FROM my_points
    ORDER BY ST_SetSRID(geom, 4326) <-> ST_SetSRID(ST_Point(-118.289, 34.022), 4326)
    LIMIT 4
) as nearest
ORDER BY distance;

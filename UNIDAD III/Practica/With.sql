SELECT
 *
FROM empleado e JOIN cargo c ON e.idcargo = c.idcargo
WHERE c.nombre = 'Investigador'

WITH
    TOTAL
    AS
    (
        SELECT
            cargo.idcargo,
            SUM(empleado.sueldo) AS 'TOTAL'
        FROM empleado
            JOIN cargo ON empleado.idcargo = cargo.idcargo
        WHERE cargo.nombre = 'Investigador'
        GROUP BY cargo.idcargo
    )
SELECT
    c.nombre,
    e.nombre,
    e.sueldo,
    t.TOTAL
FROM empleado e
    JOIN cargo c ON e.idcargo = c.idcargo
    JOIN TOTAL t ON c.idcargo = t.idcargo
WHERE c.nombre = 'Investigador'

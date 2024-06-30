WITH
    M
    AS
    
    (
        SELECT
            MIN(E.SUELDO) 'MINIMO',
            D.iddepartamento 'IP'
        FROM Empleado E
            JOIN departamento D ON E.iddepartamento = D.iddepartamento
        GROUP BY D.iddepartamento
    )
SELECT
    D.iddepartamento,
    D.nombre,
    E.idempleado,
    E.nombre,
    E.SUELDO
FROM departamento D
    JOIN Empleado E on D.iddepartamento = E.iddepartamento
    JOIN M ON M.IP = D.iddepartamento
WHERE E.sueldo = M.MINIMO



WITH
    M
    AS
    (
        SELECT
            MIN(E.SUELDO) 'MINIMO',
            D.iddepartamento 'IP',
            D.nombre
        FROM Empleado E
            JOIN departamento D ON E.iddepartamento = D.iddepartamento
        GROUP BY D.iddepartamento, D.nombre
    )
SELECT
    M.IP,
    M.nombre,
    E.idempleado,
    E.nombre,
    M.MINIMO
FROM departamento D
    JOIN Empleado E on D.iddepartamento = E.iddepartamento
    JOIN M  ON M.IP = D.iddepartamento
    WHERE E.sueldo = M.MINIMO
WITH
    V1
    AS
    (
        SELECT CUR_ID, SUM(mat_precio) PROYECTADO
        FROM MATRICULA
        GROUP BY CUR_ID
    ),
    V2
    AS
    (
        SELECT CUR_ID, SUM(pag_importe) RECAUDADO
        FROM PAGO
        GROUP BY CUR_ID
    )
SELECT
    C.cur_id, C.cur_nombre, C.cur_matriculados, V1.PROYECTADO, COALESCE(V2.RECAUDADO,0)
FROM CURSO C
    JOIN V1 ON C.cur_id = V1.cur_id
    LEFT JOIN V2 ON C.cur_id = V2.cur_id
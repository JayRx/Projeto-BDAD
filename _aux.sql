SELECT N AS Numero_de_Apostas, CC, Datas FROM (
    SELECT COUNT(idAposta) AS N, CC, Datas, AVG(valor) AS Valor_AVG, MIN(valor) AS Valor_MIN FROM (
        SELECT * FROM (
            SELECT * FROM Aposta
            WHERE probabilidade = 0.49
        ) AS Aposta
        LEFT JOIN AppliedApostaCliente
        ON Aposta.idAposta = AppliedApostaCliente.idAposta
    )
    GROUP BY CC, Datas
    ORDER BY COUNT(idAposta) DESC
)
WHERE Valor_AVG = Valor_MIN;
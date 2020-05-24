CREATE TRIGGER apostas_improvaveis_ganhas
BEFORE INSERT ON AppliedApostaCliente
FOR EACH ROW
WHEN EXISTS (
    SELECT *
    FROM Aposta AS T2
    WHERE NEW.idAposta = T2.idAposta AND
    NEW.CC in (
        SELECT CC FROM (
            SELECT *
            FROM AppliedApostaCliente
            LEFT JOIN Aposta
            ON Aposta.idAposta = AppliedApostaCliente.idAposta
            WHERE Aposta.probabilidade > 0.9 AND T2.probabilidade > 0.9 AND Aposta.Datas = T2.Datas AND Aposta.resultado = 'W' AND T2.resultado = 'W'
        )
    )
)
BEGIN
    INSERT INTO ApostaImprovavelGanha VALUES (NEW.CC, NEW.idAposta);
END;

SELECT CC, nome, SUM(CASE WHEN tipoTransacao = 'tokenDinheiro' THEN valor ELSE - valor END) AS profit FROM (
    SELECT * FROM (
        SELECT *
        FROM Transacao
        LEFT JOIN AppliedTransacaoCliente
        ON Transacao.idTransacao = AppliedTransacaoCliente.idTransacao
    ) AS T1
    LEFT JOIN Pessoa
    ON Pessoa.CC = T1.CC
)
GROUP BY CC

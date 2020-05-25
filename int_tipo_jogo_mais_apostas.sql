SELECT nome, MAX(Numero_de_Apostas) AS Numero_de_Apostas FROM (
    SELECT nome, SUM(N) AS Numero_de_Apostas FROM (
        SELECT * FROM (
            SELECT nome, COUNT(idAposta) AS N
            FROM AppliedMesaTipoJogo
            LEFT JOIN AppliedApostaMesa ON AppliedMesaTipoJogo.idMesa = AppliedApostaMesa.idMesa
            GROUP BY AppliedMesaTipoJogo.nome
        ) UNION ALL SELECT nome, COUNT(idAposta) AS N
        FROM AppliedMaquinaTipoJogo
        LEFT JOIN AppliedApostaMaquina ON AppliedMaquinaTipoJogo.idMaquina = AppliedApostaMaquina.idMaquina
        GROUP BY AppliedMaquinaTipoJogo.nome
    )
    GROUP BY nome
);

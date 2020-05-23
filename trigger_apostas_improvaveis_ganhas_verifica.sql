SELECT idAposta, Datas, valor, resultado, probabilidade, CC
FROM AppliedApostaCliente
LEFT JOIN Aposta
ON AppliedApostaCliente.idAposta = Aposta.idAposta;

INSERT INTO Aposta VALUES (21,'2019-08-01',420,'W',0.92);
INSERT INTO AppliedApostaCliente VALUES (12345678,21);
INSERT INTO Aposta VALUES (22,'2019-08-01',420,'W',0.92);
INSERT INTO AppliedApostaCliente VALUES (12345678,22);

SELECT idAposta, Datas, valor, resultado, probabilidade, CC
FROM AppliedApostaCliente
LEFT JOIN Aposta
ON AppliedApostaCliente.idAposta = Aposta.idAposta;
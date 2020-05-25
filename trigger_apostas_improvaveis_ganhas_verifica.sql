SELECT ApostaImprovavelGanha.idAposta, Datas, valor, resultado, probabilidade, CC
FROM ApostaImprovavelGanha
LEFT JOIN Aposta
ON ApostaImprovavelGanha.idAposta = Aposta.idAposta;

INSERT INTO Aposta VALUES (50,'2019-08-01',420,'W',0.92);
INSERT INTO AppliedApostaCliente VALUES (12345678,50);
INSERT INTO Aposta VALUES (51,'2019-08-01',420,'W',0.92);
INSERT INTO AppliedApostaCliente VALUES (12345678,51);

SELECT ApostaImprovavelGanha.idAposta, Datas, valor, resultado, probabilidade, CC
FROM ApostaImprovavelGanha
LEFT JOIN Aposta
ON ApostaImprovavelGanha.idAposta = Aposta.idAposta;

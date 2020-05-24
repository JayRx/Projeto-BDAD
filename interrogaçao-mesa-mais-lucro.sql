.mode columns
.headers on
.nullvalue	NULL
CREATE VIEW valorGanho
AS
  SELECT*FROM(SELECT*FROM(SELECT idAposta,sum(valor) AS Ganho FROM Aposta natural join AppliedApostaMesa WHERE resultado='W') natural join Mesa);

CREATE VIEW valorPerdido
AS
  SELECT*FROM(SELECT*FROM(SELECT idAposta,sum(valor) AS Perdido FROM Aposta natural join AppliedApostaMesa WHERE resultado='L' ) natural join Mesa);

SELECT idMesa,max(Ganho-Perdido) AS lucro FROM (valorGanho natural join valorPerdido);

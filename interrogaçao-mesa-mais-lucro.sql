CREATE VIEW valorGanho
AS
  SELECT*FROM(SELECT*FROM(SELECT idAposta,sum(valor) AS Ganho FROM Aposta WHERE resultado='W' natural join AppliedApostaMesa) natural join Mesa);

CREATE VIEW valorPerdido
AS
  SELECT*FROM(SELECT*FROM(SELECT idAposta,sum(valor) AS Perdido FROM Aposta WHERE resultado='L' natural join AppliedApostaMesa) natural join Mesa);

SELECT Mesa,max(Ganho-Perdido) AS lucro FROM (valorGanho natural join valorPerdido);

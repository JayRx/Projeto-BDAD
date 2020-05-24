.mode columns
.headers on
.nullvalue	NULL
DROP VIEW valorGanho IF EXISTS
CREATE VIEW valorGanho
AS
  SELECT*FROM Mesa,AppliedApostaMesa,Aposta,sum(valor) AS Ganho WHERE Mesa.idMesa=AppliedApostaMesa.idMesa AND Aposta.idAposta=AppliedApostaMesa.idAposta AND resultado='W'

DROP VIEW valorPerdido IF EXISTS
CREATE VIEW valorPerdido
AS
  SELECT*FROM Mesa,AppliedApostaMesa,Aposta,sum(valor) AS Perdido WHERE Mesa.idMesa=AppliedApostaMesa.idMesa AND Aposta.idAposta=AppliedApostaMesa.idAposta AND resultado='L'

SELECT idMesa,max(Ganho-Perdido) AS lucro FROM (valorGanho natural join valorPerdido); valor

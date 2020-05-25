.mode columns
.headers on
.nullvalue	NULL
DROP VIEW IF EXISTS valorGanho;
CREATE VIEW valorGanho
AS
  SELECT*,sum(valor) AS Ganho FROM Mesa,AppliedApostaMesa,Aposta WHERE Mesa.idMesa=AppliedApostaMesa.idMesa AND Aposta.idAposta=AppliedApostaMesa.idAposta AND resultado='W';

DROP VIEW IF EXISTS valorPerdido;
CREATE VIEW valorPerdido
AS
  SELECT*,sum(valor) AS Perdido FROM Mesa,AppliedApostaMesa,Aposta WHERE Mesa.idMesa=AppliedApostaMesa.idMesa AND Aposta.idAposta=AppliedApostaMesa.idAposta AND resultado='L';

SELECT idMesa,max(Ganho-Perdido) AS lucro FROM (valorGanho natural join valorPerdido);

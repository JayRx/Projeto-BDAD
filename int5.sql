SELECT maquina, max(avarias) as avarias
from 
(
    select idMaquina as maquina, count(*) as avarias
    from Reparacao
    inner join AppliedMaquinaReparacao on AppliedMaquinaReparacao.idReparacao=Reparacao.idReparacao
    group by idMaquina
);

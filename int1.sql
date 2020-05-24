SELECT max(numeroMesa+numeroMaquina) FROM 
(SELECT count(TipoJogo) AS numeroMesa,TipoJogo.nome FROM TipoJogo natural join Mesa
group by TipoJogo),
(SELECT count(TipoJogo) AS numeroMaquina,TipoJogo.nome FROM TipoJogo natural join Maquina
group by TipoJogo)
  WHERE TipoJogo.nome = TipoJogo.nome

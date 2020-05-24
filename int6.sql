select nome,CC,max(total_aposta) as valor
from
(
	select CC as id,sum(valor) as total_aposta
	from Aposta
    inner join AppliedApostaCliente on AppliedApostaCliente.idAposta=Aposta.idAposta
    group by id 
)
inner join Pessoa on Pessoa.CC=id;       


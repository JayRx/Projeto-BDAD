SELECT nome, Empregado.CC as CC, valor as valor_apostado from Empregado
inner join Pessoa on Pessoa.CC=Empregado.CC
inner join AppliedApostaCliente on AppliedApostaCliente.CC=Empregado.CC
inner join Aposta on Aposta.idAposta=AppliedApostaCliente.idAposta 
where valor>salario/2;  

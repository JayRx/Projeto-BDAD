drop trigger if exists funcionario_viciado;
create trigger funcionario_viciado
after insert on AppliedApostaCliente
WHEN
            (
            SELECT valor from Empregado
            inner join AppliedApostaCliente on AppliedApostaCliente.CC=Empregado.CC
            inner join Aposta on Aposta.idAposta=AppliedApostaCliente.idAposta 
            where valor>salario/2
            >0
            )
BEGIN
           insert into Funcionario_Viciado
            SELECT Empregado.CC, nome from Empregado
            inner join Pessoa on Pessoa.CC=Empregado.CC
            inner join AppliedApostaCliente on AppliedApostaCliente.CC=Empregado.CC
            inner join Aposta on Aposta.idAposta=AppliedApostaCliente.idAposta 
            where valor>salario/2;            
END;

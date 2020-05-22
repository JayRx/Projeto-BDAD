drop trigger if exists funcionario_viciado;
create trigger funcionario_viciado
after insert on AppliedApostaCliente
BEGIN
     SELECT case WHEN
            (
            SELECT valor from Empregado
            inner join AppliedApostaCliente on AppliedApostaCliente.CC=Empregado.CC
            inner join Aposta on Aposta.idAposta=AppliedApostaCliente.idAposta 
            where valor>salario
            >0
            )

     THEN 
     raise(ABORT, 'FUNCIONÁRIO VICIADO!!!')
     end;
END;
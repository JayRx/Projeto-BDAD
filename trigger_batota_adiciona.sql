drop trigger if exists batota;
create trigger batota
after insert on AppliedApostaCliente
WHEN
(
    select valor from Cliente
    inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
    inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
    WHERE valor/2 >
    (
        select valor from Cliente
        inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
        inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        WHERE valor/2>
        (
            select valor from Cliente
            inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
            inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        )
    )
    and 
    Datas=
    (
        select Datas from Cliente
        inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
        inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        WHERE Datas>
        (
            select Datas from Cliente
            inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
            inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        )
    )
)

BEGIN
    --select raise(ABORT, 'BATOTA!!!!');
     insert into Batoteiro
    select Cliente.CC from Cliente
    inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
    inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
    WHERE valor/2 >
    (
        select valor from Cliente
        inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
        inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        WHERE valor/2>
        (
            select valor from Cliente
            inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
            inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        )
    )
    and 
    Datas=
    (
        select Datas from Cliente
        inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
        inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        WHERE Datas>
        (
            select Datas from Cliente
            inner join AppliedApostaCliente on AppliedApostaCliente.CC=Cliente.CC
            inner join Aposta on Aposta.idAposta=AppliedApostaCLiente.idAposta
        )
    ); 
end;
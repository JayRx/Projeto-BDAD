drop trigger if exists verifica_fornecedores;
create trigger verifica_fornecedores
before insert on Fornecedor
begin
select case WHEN
(
    (select count(*) from Fornecedor) >=15
)
THEN
    raise(ABORT, 'Máximo de fornecedores atingido!!!')
end;
end;
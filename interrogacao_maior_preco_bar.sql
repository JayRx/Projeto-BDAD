/* select nomeArtista,max(average)
FROM
( */
    SELECT Produto.nome as Produto,max(valor) as max_valor, nomeArtista as Artista, Fornecedor.nome as Fornecedor from Preco_Venda 
    inner join Produto on Produto.idProduto=Preco_Venda.idProduto
    inner join Applied3 on Applied3.idEspetaculo=Preco_Venda.idEspetaculo
    inner join Fornece on Fornece.idProduto=Preco_Venda.idProduto
    inner join Fornecedor on Fornecedor.idFornecedor=Fornece.idFornecedor
    group by Produto.nome
    order by max_valor DESC;

/* )
inner join Applied3 on Applied3.idEspetaculo=espetaculo; */
SELECT * FROM (
    SELECT idFornecedor, COUNT(idProduto) AS numeroDeProdutos FROM FORNECE
    GROUP BY idFornecedor
)
WHERE numeroDeProdutos = (
    SELECT MAX(numeroDeProdutos)
    FROM (
        SELECT idFornecedor, COUNT(idProduto) AS numeroDeProdutos FROM FORNECE
        GROUP BY idFornecedor
    )
)

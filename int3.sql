SELECT (SELECT sum(valor) FROM Transacao
WHERE tipoTransacao = 'dinheiroToken')
- (SELECT sum(valor) FROM Transacao
WHERE tipoTransacao = 'tokenDinheiro')

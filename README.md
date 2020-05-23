# Projeto BDAD - G101
##### Criado por:
* Luís André Santos Correia Assunção
* Luis Guilherme de Melo Félix Diogo
* João Paulo Silva da Rocha
---
##### Ficheiros:
###### Criar e Povoar:
* [criar.sql](criar.sql) - Cria todas as tabelas necessárias para a base de dados.
* [povoar.sql](povoar.sql) - Preenche as tabelas com informação.

###### Interrogações:
* [int_getTransactionDiff.sql](int_getTransactionDiff.sql) - Retorna a diferença entre ganhos e perdas do casino
* [int_getClientProfit.sql](int_getClientProfit.sql) - Retorna a diferença entre ganhos e perdas de cada cliente
* [int_getGreaterFornecedor.sql](int_getGreaterFornecedor.sql) - Retorna o fornecedor que fornece uma maior variedade  de tipos de produtos.
* [interrogacao_cliente_mais_valor_apostado.sql](interrogacao_cliente_mais_valor_apostado.sql) - Retorna ...
* [interrogacao_maior_preco_bar.sql](interrogacao_maior_preco_bar.sql) - Retorna ...
* [interrogacao_maquina_mais_avarias.sql](interrogacao_maquina_mais_avarias.sql) - Retorna a Máquina com mais avarias
* [interrogaçao-empregado-trabalha-mais-horas.sql](interrogaçao-empregado-trabalha-mais-horas.sql) - Retorna o Empregado que trabalha mais horas

###### Triggers:
* [trigger_aposta_metade_salario.sql](trigger_aposta_metade_salario.sql) - Verifica se um Empregado apostou mais de metade do seu salário
* [trigger_salario_verifica.sql](trigger_salario_verifica.sql) - Verifica o trigger anterior
<br />
* [trigger_apostas_improvaveis_ganhas.sql](trigger_apostas_improvaveis_ganhas.sql) - Verifica se um Cliente ganhou duas ou mais apostas com probabilidade inferior a 0.1 (de 0 a 1) (probabilidade de o casino ganhar: maior que 0.9) no mesmo dia
* [trigger_apostas_improvaveis_ganhas.sql](trigger_apostas_improvaveis_ganhas.sql) - Elimina o trigger anterior
* [trigger_apostas_improvaveis_ganhas.sql](trigger_apostas_improvaveis_ganhas.sql) - Verifica o trigger anterior

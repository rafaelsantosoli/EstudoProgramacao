# Dicionario de dados

## Introdução

## Estrutura de tabela de participante

Criar uma tabela com estrutura semelhante a tabela de participante do sistema SA1 (Cadastro de Clientes).

Utilizar as colunas da SA1 abaixo como referência:
A1_COD
A1_LOJA
A1_PESSOA
A1_NOME
A1_NREDUZ
A1_END
A1_TIPO
A1_EST
A1_MUN
A1_BAIRRO
A1_IBGE
A1_NATUREZ
A1_CEP
A1_DDI
A1_DDD
A1_TEL
A1_CGC
A1_PAIS
A1_CONTATO

Para filtrar no banco de dados utilize a consulta

```sql

SELECT * FROM SX3990 WHERE X3_CAMPO ='A1_COD'
--ou
SELECT * FROM SX3T10 WHERE X3_CAMPO ='A1_COD'

```

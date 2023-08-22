# Tipos de dados

Podemos definir um tipo de dado como um conjunto de valores e operações que podem ser realizadas com esses valores. Os tipos de dados são utilizados para definir o tipo de dado que será armazenado em uma variável.

Por exemplo, podemos definir seres humanos como um tipo de dado que possui os valores "nome", "idade" e "sexo". Podemos realizar operações com esses valores, como por exemplo, calcular a idade de uma pessoa.

Exemplo de variável do {c:red} tipo ser {/c} humano:


| Descrição | Dado | Tipo do dado |
| --- | --- | --- |
| Nome | João | String |
| Idade | 20 | Inteiro |
| Sexo | Masculino | String |

## Tipos inteiros

São caracterizados como tipos inteiros, os dados numéricos positivos ou negativos, excluindo-se destes qualquer número fracionário. Como exemplo deste tipo de dado, tem-se os valores: 35, 0, -56, 1024 entre outros.

Exemplo de variável do tipo inteiro:

| Descrição | Dado | Tipo do dado |
| --- | --- | --- |
| Idade | 20 | Inteiro |

## Tipos reais

São caracterizados como tipos reais, aqueles que possuem parte decimal ou são 
números fracionários, e podem ser positivos, negativos ou zero. Exemplos de 
dados do tipo real são 3.2 (real positivo), 0.00 (zero real) e -19.76 (real negativo).

Exemplo de variável do tipo real:

| Descrição | Dado | Tipo do dado |
| --- | --- | --- |
| Altura | 1.80 | Real |

## Tipos Caractere

São caracterizados como tipos caracteres, as sequências contendo letras, números e símbolos especiais. Uma sequência de caracteres deve ser indicada entre aspas (“”). Este tipo de dado também é conhecido como alfanumérico, string, literal ou cadeia. Como exemplo deste tipo de dado, tem-se os valores: “Programação”, “Rua Alfa, 52 Apto 1”, “Fone 574-9988”, “04387- 
030”, “ ”, “7” entre outros.

Exemplo de variável do tipo caractere:

| Descrição | Dado | Tipo do dado |
| --- | --- | --- |
| Nome | João | String |

## Tipos lógicos

São caracterizados como tipos lógicos os dados com valor verdadeiro e falso, sendo que este tipo de dado poderá representar apenas um dos dois valores. Ele é chamado por alguns de tipo booleano, devido à contribuição do filósofo e matemático inglês George Boole na área da lógica matemática.

Exemplo de variável do tipo lógico:

| Descrição | Dado | Tipo do dado |
| --- | --- | --- |
| Aprovado | True | Lógico |
| Reprovado | False | Lógico |


### Tipos de dados primitivos

Os tipos de dados primitivos são os tipos de dados que já estão definidos na linguagem de programação.

#### Tipos de dados primitivos do ADVPL

| Tipo de dado | Descrição | Indicador |Exemplo |
| --- | --- | --- | --- |
| numeric | Armazena um número | N | 1 |
| char / character | Armazena um caractere | C | "A" |
| date | Armazena uma data | D | CTOD("01/01/2019") |
| block / codeblock | Armazena um bloco de código | B | { || ... } |
| logical | Armazena um valor lógico | L | .T. |
| Array | Armazena um array | A | { || ... } |
| object | Armazena um objeto | O | { || ... } |
| variadic | Armazena um número variável de parâmetros | V | { || ... } |


#### Tipos de dados primitivos do TlPP

![Alt text](./Imagens/Tipo_Tlpp.png)

#### Tipos de dados Primitivos python

| Tipo de dado | Descrição | Indicador |Exemplo |
| --- | --- | --- | --- |
| int | Armazena um número inteiro | N | 1 |
| float | Armazena um número decimal | N | 1.0 |
| str | Armazena uma string | C | "A" |
| bool | Armazena um valor lógico | L | True |
| list | Armazena uma lista | A | [1,2,3] |
| tuple | Armazena uma tupla | A | (1,2,3) |
| dict | Armazena um dicionário | O | {1:2, 3:4} |
| complex | Armazena um número complexo | N | 1+2j |

## Referências

- [Tipos de Dados](https://tdn.totvs.com/display/tec/Tipagem+de+Dados#TipagemdeDados-3.TiposdeDados)
- [Tipos Nativos TLPP](https://tdn.totvs.com/display/tec/Tipos+Nativos)
- [Tipos De Variáveis Disponíveis No Python](https://pythonacademy.com.br/blog/tipos-de-variaveis-no-python)
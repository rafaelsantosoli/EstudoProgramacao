# Formas de representação de algoritmos

## Fluxograma

O pseudocódigo é uma forma genérica de escrever um algoritmo, utilizando uma linguagem simples (nativa a quem escreve) e que pode ser facilmente convertida para uma linguagem de programação.

O pseudocódigo é uma forma de representação de algoritmos que não é padronizada, ou seja, não existe uma regra que defina como um algoritmo deve ser escrito em pseudocódigo. Porém, existem algumas convenções que são utilizadas para facilitar a compreensão do algoritmo.

### Convenções

- **Declaração de variáveis**: As variáveis devem ser declaradas no início do algoritmo, antes de qualquer comando. A declaração de variáveis deve ser feita da seguinte forma:

``` pseudocode

variavel: tipo

```

- **Comentários**: Os comentários são utilizados para explicar o que cada parte do algoritmo faz. Os comentários são ignorados pelo compilador, ou seja, não são executados. Os comentários podem ser feitos de duas formas:

``` pseudocode

// Comentário de uma linha

/* Comentário de
   múltiplas linhas */

```

- **Comandos**: Os comandos são as instruções que o algoritmo deve executar. Os comandos podem ser feitos de duas formas:

``` pseudocode

comando1

comando2

```

ou

``` pseudocode

comando1; comando2;

```

- **Estruturas de controle**: As estruturas de controle são utilizadas para controlar o fluxo de execução do algoritmo. As estruturas de controle podem ser feitas de duas formas:

``` pseudocode

se (condição) então

    comando1

senão
    
    comando2
fimse

```

ou

``` pseudocode

se (condição) então comando1 senão comando2 fimse

```

- **Estruturas de repetição**: As estruturas de repetição são utilizadas para repetir um conjunto de comandos enquanto uma condição for verdadeira. As estruturas de repetição podem ser feitas de duas formas:

``` pseudocode

enquanto (condição) faça

    comando

fimenquanto

```

ou

``` pseudocode

enquanto (condição) faça comando fimenquanto

```

- **Funções**: As funções são utilizadas para agrupar um conjunto de comandos que podem ser utilizados em diferentes partes do algoritmo. As funções podem ser feitas de duas formas:

``` pseudocode

função nome(parametros)

    comando1

    comando2

fimfunção

```

ou

``` pseudocode

função nome(parametros) comando1 comando2 fimfunção

```

- **Procedimentos**: Os procedimentos são utilizados para agrupar um conjunto de comandos que podem ser utilizados em diferentes partes do algoritmo. Os procedimentos podem ser feitos de duas formas:

``` pseudocode

procedimento nome(parametros)

    comando1

    comando2

fimprocedimento

```

ou

``` pseudocode

procedimento nome(parametros) comando1 comando2 fimprocedimento

```

- **Estruturas de dados**: As estruturas de dados são utilizadas para agrupar um conjunto de dados que podem ser utilizados em diferentes partes do algoritmo. As estruturas de dados podem ser feitas de duas formas:

``` pseudocode

estrutura nome

    dado1

    dado2

fimestrutura

```

ou

``` pseudocode

estrutura nome dado1 dado2 fimestrutura

```

- **Tipos de dados**: Os tipos de dados são utilizados para definir o tipo de dado que será armazenado em uma variável. Os tipos de dados podem ser feitos de duas formas:

``` pseudocode

tipo nome

    dado1

    dado2

fimtipo

```

ou

``` pseudocode

tipo nome dado1 dado2 fimtipo

```

- **Operadores**: Os operadores são utilizados para realizar operações matemáticas. Os operadores podem ser feitos de duas formas:

``` pseudocode

operador1 operador2

```

- **Expressões**: As expressões são utilizadas para realizar operações matemáticas. As expressões podem ser feitas de duas formas:

``` pseudocode

expressão1 expressão2

```

- **Constantes**: As constantes são utilizadas para armazenar valores que não podem ser alterados durante a execução do algoritmo. As constantes podem ser feitas de duas formas:

``` pseudocode

constante1 constante2

```

- **Variáveis**: As variáveis são utilizadas para armazenar valores que podem ser alterados durante a execução do algoritmo. As variáveis podem ser feitas de duas formas:

``` pseudocode

variavel1 variavel2

```

- **Entrada de dados**: A entrada de dados é utilizada para receber dados do usuário. A entrada de dados pode ser feita de duas formas:

``` pseudocode

leia(dado)

```

- **Saída de dados**: A saída de dados é utilizada para exibir dados para o usuário. A saída de dados pode ser feita de duas formas:

``` pseudocode

escreva(dado)

```

Exemplo:

``` c++

algoritmo "exemplo1"
var
   n1, n2, soma: real
 
inicio
 
escreva("digite um número ")
leia(n1)
escreva("digite outro número ")
leia(n2)
soma <- n1 + n2;
escreva(" primeiro número = ", n1)
escreva(" segundo número = ", n2)
escreva(" soma = ", soma)
 
fimalgoritmo

```

## Referências:

- [Pseudocódigo](https://embarcados.com.br/pseudocodigo/)

- [Wikipedia Pseudocódigo](https://pt.wikipedia.org/wiki/Pseudoc%C3%B3digo)
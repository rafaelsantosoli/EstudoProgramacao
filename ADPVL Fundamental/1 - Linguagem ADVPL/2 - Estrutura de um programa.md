# Estrutura de um programa

## Sumário

- [Estrutura de um programa](#estrutura-de-um-programa)
  - [Sumário](#sumário)
  - [Estrutura de um programa ADVPL](#estrutura-de-um-programa-advpl)
    - [Linhas de Programa](#linhas-de-programa)
      - [Linhas de Comando](#linhas-de-comando)
      - [Linhas de Comentário](#linhas-de-comentário)
      - [Linhas Mistas](#linhas-mistas)
      - [Tamanho das Linhas](#tamanho-das-linhas)
    - [Areas de um Programa](#areas-de-um-programa)
      - [Área de Identificação](#área-de-identificação)
      - [Área de Declaração de Variáveis ou Ajustes iniciais](#área-de-declaração-de-variáveis-ou-ajustes-iniciais)
      - [Corpo do Programa](#corpo-do-programa)
      - [Área de Finalização ou Área de Encerramento](#área-de-finalização-ou-área-de-encerramento)

## Estrutura de um programa ADVPL

Um programa ADVPL é composto por um conjunto de comandos e funções que são executados sequencialmente, de cima para baixo, e de dentro para fora, de acordo com a estrutura de controle de fluxo do programa.

### Linhas de Programa

As linhas existentes dentro de um arquivo texto de código de programa podem ser 
linhas de comando, linhas de comentário ou linhas mistas.

#### Linhas de Comando

Linhas de comando possuem os comandos ou instruções que serão executadas.

```advpl

// Exemplo de linha de comando

Local nCnt
Local nSoma := 0
For nCnt := 1 To 10
nSoma += nCnt
Next nCnt

```

#### Linhas de Comentário

Comentários são linhas de texto que são ignoradas pelo interpretador ADVPL. Eles são utilizados para documentar o código fonte, e podem ser de duas formas:

- Comentários de linha única: Iniciam com `//` e terminam com o final da linha.
- Comentários de múltiplas linhas: Iniciam com `/*` e terminam com `*/`.

#### Linhas Mistas

Linhas mistas são linhas que contém tanto comandos quanto comentários.

```advpl

// Exemplo de linha mista

Local nCnt
Local nSoma := 0
For nCnt := 1 To 10
    nSoma += nCnt // Comentário
Next nCnt

```

#### Tamanho das Linhas

Assim como a linha física, delimitada pela quantidade de caracteres que pode ser digitado no editor de textos utilizado, existe uma linha considerada linha lógica. A linha lógica é aquela considerada para a compilação como uma única linha de comando.A princípio, cada linha digitada no arquivo texto é diferenciada após o pressionamento da tecla <Enter>. Ou seja, a linha lógica é a linha física no arquivo.

Porém algumas vezes, por limitação física do editor de texto ou por estética, pode-se "quebrar" a linha lógica em mais de uma linha física no arquivo texto. Isto é efetuado utilizando-se o sinal de ponto-e-vírgula `(;)`.

```advpl

// Exemplo de linha lógica

Local nCnt ; Local nSoma := 0 ; For nCnt := 1 To 10 ; nSoma += nCnt ; Next nCnt

```

### Areas de um Programa

Apesar de não ser uma linguagem de padrões rígidos com relação à estrutura do programa, é importante identificar 

algumas de suas partes. Considere o programa de exemplo abaixo:

```advpl

#include protheus.ch
    /*
    +===========================================+
    | Programa: Cálculo do Fatorial |
    | Autor : Microsiga Software S.A. |
    | Data : 02 de outubro de 2001 |
    +===========================================+
    */
User Function CalcFator()
    Local nCnt
    Local nResultado := 1 // Resultado do fatorial
    Local nFator := 5 // Número para o cálculo
    
    // Cálculo do fatorial
    For nCnt := nFator To 1 Step -1
        nResultado *= nCnt
    Next nCnt
    
    // Exibe o resultado na tela, através da função alert
    MsgAlert("O fatorial de " + cValToChar(nFator) + ;
    " é " + cValToChar(nResultado))
    
    // Termina o programa
Return( NIL )

```

A estrutura de um programa ADVPL é composta pelas seguintes áreas:

#### Área de Identificação

Esta é uma área que não é obrigatória e é dedicada a documentação do programa. Quando existente, contém apenas comentários explicando a sua finalidade, data de criação, autor, etc., e aparece no começo do programa, antes de qualquer linha de comando.

O formato para esta área não é definido. Pode-se colocar qualquer tipo de informação desejada e escolher a formatação apropriada.

```advpl

#include “protheus.ch”
/*
+==========================================+
| Programa: Cálculo do Fatorial |
| Autor : Microsiga Software S.A. |
| Data : 02 de outubro de 2001 |
+==========================================+
*/
User Function CalcFator()

```

Opcionalmente podem-se incluir definições de constantes utilizadas no programa ou inclusão de arquivos de cabeçalho nesta área.

#### Área de Declaração de Variáveis ou Ajustes iniciais

Nesta área geralmente se fazem os ajustes iniciais, importantes para o correto funcionamento do programa. Entre os ajustes se encontram declarações de variáveis, inicializações, abertura de arquivos, etc. Apesar do ADVPL não ser uma linguagem rígida e as variáveis poderem ser declaradas em qualquer lugar do programa, é aconselhável fazê-lo nesta área visando tornar o código mais legível e facilitar a identificação de variáveis não utilizadas.

```advpl

    Local nCnt
    Local nResultado := 0 // Resultado do fatorial
    Local nFator := 10 // Número para o cálculo

```

#### Corpo do Programa

Esta é a área principal do programa, onde se encontram os comandos que realizam a tarefa para a qual o programa foi criado.

```advpl

    // Cálculo do fatorial
    For nCnt := nFator To 1 Step -1
        nResultado *= nCnt
    Next nCnt

```

#### Área de Finalização ou Área de Encerramento

Esta área é opcional e é utilizada para finalizar o programa. Nela se encontram comandos que fecham arquivos, liberam memória, etc.

```advpl

    // Exibe o resultado na tela, através da função alert
    MsgAlert("O fatorial de " + cValToChar(nFator) + ;
    " é " + cValToChar(nResultado))
    
    // Termina o programa
Return( NIL )

```
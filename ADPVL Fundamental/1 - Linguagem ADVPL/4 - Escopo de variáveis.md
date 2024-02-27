# Escopo de variáveis

## Índice

- [Escopo de variáveis](#escopo-de-variáveis)
  - [Índice](#índice)
  - [Introdução](#introdução)
  - [O Contexto de Variáveis dentro de um Programa](#o-contexto-de-variáveis-dentro-de-um-programa)
  - [Variáveis de escopo Locais (Local)](#variáveis-de-escopo-locais-local)
  - [Variáveis de escopo estático (Static)](#variáveis-de-escopo-estático-static)
  - [Variáveis de escopo privado (Private)](#variáveis-de-escopo-privado-private)
  - [Variáveis de escopo público (Public)](#variáveis-de-escopo-público-public)
  - [Variáveis de escopo global (Global)](#variáveis-de-escopo-global-global)
  - [Entendendo a influência do escopo das variáveis](#entendendo-a-influência-do-escopo-das-variáveis)
  - [Operações com Variáveis](#operações-com-variáveis)

## Introdução

Para declarar uma variável deve-se utilizar um identificador de escopo. Um identificador de escopo é uma palavra chave que indica a que contexto do programa a variável declarada pertence. O contexto de variáveis pode ser local (visualizadas apenas dentro do programa atual), público (visualizadas por qualquer outro programa), entre outros.

## O Contexto de Variáveis dentro de um Programa

Dentro de um programa, as variáveis podem ser declaradas em diferentes contextos. Os principais contextos de variáveis são:

- **Local**: Variáveis declaradas dentro de um programa ou função. São visíveis apenas dentro do programa ou função onde foram declaradas.
- **Public**: Variáveis declaradas em um programa ou função, mas que podem ser acessadas por qualquer outro programa ou função.
- **Private**: Variáveis declaradas em um programa ou função, mas que só podem ser acessadas por funções ou programas específicos.
- **Static**: Variáveis que mantêm seu valor entre chamadas de função e só podem ser acessadas dentro do programa ou função onde foram declaradas.

Quando um valor é atribuído a uma variável em um programa ou função, o ADVPL criará a variável caso ela não tenha sido declarada anteriormente. A variável então é criada como se tivesse sido declarada como Private.

Devido a essa característica, quando se pretende fazer uma atribuição a uma variável declarada previamente, mas escreve-se o nome da variável de forma incorreta, o ADVPL não gerará nenhum erro de compilação ou de execução. Pois compreenderá o nome da variável escrito de forma incorreta como se fosse a criação de uma nova variável. Isto alterará a lógica do programa, e é um erro muitas vezes difícil de identificar.

## Variáveis de escopo Locais (Local)

Variáveis de escopo local são pertencentes apenas ao escopo da função onde foram declaradas e devem ser explicitamente declaradas com o identificador LOCAL, como no exemplo:

```advpl

User Function Main()
    Local nNum := 10
    Local cString := "Texto"
    Local lVerdadeiro := .T.
    Local dData := DtoD(01,01,2020)

    // ...
        //comandos
    // ...
Return

```

- Quando uma variável é declarada como local, ela só pode ser acessada dentro da função onde foi declarada. Se uma variável local for declarada com o mesmo nome de uma variável global, a variável local terá precedência sobre a variável global.

- Quando a função termina, as variáveis locais são automaticamente destruídas.

- Se uma função é chamada recursivamente (por exemplo, chama a si mesma), cada chamada em recursão cria um novo conjunto de variáveis locais.

## Variáveis de escopo estático (Static)

Variáveis de escopo estático são variáveis que mantêm seu valor entre chamadas de função e só podem ser acessadas dentro do programa ou função onde foram declaradas. Elas são declaradas com o identificador STATIC, como no exemplo:

```advpl

Static nNum1 := 10

User Function Main()
    Static nNum2 := 10
    Static cString := "Texto"
    Static lVerdadeiro := .T.
    Static dData := DtoD(01,01,2020)

    // ...
        //comandos
    // ...

Return

- O escopo das variáveis static depende de onde são declaradas. Se forem declaradas dentro do corpo de uma função ou procedimento, seu escopo será limitado àquela rotina. Se forem declaradas fora do corpo de qualquer rotina, seu escopo afeta a todas as funções declaradas no fonte. Neste exemplo, a variável nNum1 é declarada como static e inicializada com o valor 10, e pode ser acessada por qualquer função declarada no fonte.

jà a variável nNum2 é declarada como static e inicializada com o valor 10, e pode ser acessada apenas pela função Main.

Quando ocorre uma chamada recursiva, a variável static mantém seu valor entre as chamadas.

Exemplo:

```advpl

Static nNum := 0

User Function Main()

    nNum := nNum + 1

    If nNum < 10
        Main()
    EndIf

Return

```

Neste exemplo, a variável nNum é declarada como static e inicializada com o valor 0. A cada chamada recursiva, o valor de nNum é incrementado em 1. O valor de nNum é mantido entre as chamadas recursivas. No final, o valor de nNum será 10.

## Variáveis de escopo privado (Private)

Variáveis de escopo privado são variáveis declaradas em um programa ou função, mas que só podem ser acessadas por funções ou programas específicos. Elas são declaradas com o identificador PRIVATE, como no exemplo:

```advpl


User Function Main()
    Private cString := "Texto"
    Private lVerdadeiro := .T.
    Private dData := DtoD(01,01,2020)
    Private nNum := 10

    // ...
        //comandos
    // ...

Return

- A declaração é opcional para variáveis privadas. Mas podem ser declaradas explicitamente com o identificador 
PRIVATE. 

:exclamation: **Atenção**: A declaração de variáveis privadas é opcional, mas é uma boa prática declarar variáveis privadas explicitamente. 

Isso torna o código mais legível e fácil de entender. Hoje em dia, é considerado débito técnico não declarar variáveis explicitamente.

Adicionalmente, a atribuição de valor a uma variável não criada anteriormente, de forma automática cria-se a variável como privada. Uma vez criada, uma variável privada continua a existir e mantém seu valor até que o programa ou função onde foi criada termine (ou seja, até que a função onde foi feita retorne para o código que a executou). Neste momento, é automaticamente destruída.

É possível criar uma nova variável privada com o mesmo nome de uma variável já existente. Entretanto, a nova 
(duplicada) variável pode apenas ser criada em um nível de ativação inferior ao nível onde a variável foi declarada pela primeira vez (ou seja, apenas em uma função chamada pela função onde a variável já havia sido criada). A nova variável privada esconderá qualquer outra variável privada ou pública (veja a documentação sobre variáveis públicas) com o mesmo nome enquanto existir.

Uma vez criada, uma variável privada é visível em todo o programa, enquanto não for destruída automaticamente, 
quando a rotina que a criou terminar ou uma outra variável privada com o mesmo nome for criada em uma subfunção 
chamada (neste caso, a variável existente torna-se inacessível até que a nova variável privada seja destruída).
Em termos mais simples, uma variável privada é visível dentro da função de criação e todas as funções chamadas por esta, a menos que uma função chamada crie sua própria variável privada com o mesmo nome.

Exemplo:

```advpl

User Function Main()
    Private nNum := 10

    Funcao1()

Return

User Function Funcao1()
    Private nNum := 20

    Funcao2()

Return

User Function Funcao2()
    Private nNum := 30

Return

```

Neste exemplo, a função Main cria a variável privada nNum e a inicializa com o valor 10. A função Main chama a função Funcao1, que cria a variável privada nNum e a inicializa com o valor 20. A função Funcao1 chama a função Funcao2, que cria a variável privada nNum e a inicializa com o valor 30.

Quando a função Funcao2 termina, a variável privada nNum é destruída. Quando a função Funcao1 termina, a variável privada nNum é destruída. Quando a função Main termina, a variável privada nNum é destruída.

## Variáveis de escopo público (Public)

Podem-se criar variáveis de escopo public dinamicamente, no código com o identificador PUBLIC. As variáveis deste escopo continuam a existir e mantêm seu valor até o fim da execução da thread (conexão).

É possível criar uma variável de escopo private com o mesmo nome de uma variável de escopo public existente,  entretanto, não é permitido criar uma variável de escopo public com o mesmo nome de uma variável de escopo private existente.

Uma vez criada, uma variável de escopo public é visível em todo o programa em que foi declarada, até que seja  escondida por uma variável de escopo private, criada com o mesmo nome. A nova variável de escopo private criada  esconde a variável de escopo public existente, e esta se tornará inacessível até que a nova variável private seja destruída.

```advpl

User Function Main()
    Public cString := "Texto"
    Public lVerdadeiro := .T.
    Public dData := DtoD(01,01,2020)
    Public nNum := 10

    filha()

Return

User Function filha()
    Private nNum := 20
Return

```

Neste exemplo, a função Main cria a variável public nNum e a inicializa com o valor 10. A função Main chama a função filha, que cria a variável privada nNum e a inicializa com o valor 20. A variável public nNum é escondida pela variável private nNum, e se torna inacessível até que a variável private nNum seja destruída.

:exclamation: **Atenção**: Diferentemente dos outros identificadores de escopo, quando uma variável é declarada como pública sem ser inicializada, o valor assumido é falso (.F.) e não nulo (nil).

No ambiente ERP Protheus, existe uma convenção adicional a qual deve ser respeitada que variáveis em uso pela  aplicação não sejam incorretamente manipuladas. Por esta convenção deve ser adicionado o caractere “_” antes do  nome de variáveis PRIVATE e PUBLIC. Maiores informações avaliar o tópico: Boas Práticas de Programação.

Exemplo: Public _cRotina

## Variáveis de escopo global (Global)

Variáveis de escopo global são variáveis que podem ser acessadas por qualquer programa ou função. Elas são declaradas com o uso de funções específicas, como por exemplo, a função PutGlbValue() ou PutGlbVars().

Variáveis globais são utilizadas para compartilhar informações entre diferentes programas, funções ou threads.

Para maiores informações sobre variáveis globais, consulte a documentação específica.

[Manipulação de variáveis globais](https://tdn.totvs.com/display/tec/PutGlbValue)

## Entendendo a influência do escopo das variáveis

Considere as linhas de código de exemplo:

```advpl

nResultado := 250 * (1 + (nPercentual / 100))

```

Se esta linha for executada em um programa ADVPL, ocorrerá um erro de execução com a mensagem `"variable does not exist: nPercentual"`, pois esta variável está sendo utilizada em uma expressão de cálculo sem ter sido declarada.

Para solucionar este erro, deve-se declarar a variável previamente:

```advpl

Local nPercentual, nResultado
nResultado := 250 * (1 + (nPercentual / 100))

```

Neste exemplo, as variáveis são declaradas previamente, utilizando o identificador de escopo local. Quando a linha de cálculo for executada, o erro de variável não existente não mais ocorrerá. Porém variáveis não inicializadas têm sempre o valor default nulo (Nil) e este valor não pode ser utilizado em um cálculo, pois também gerará erros de execução (nulo não pode ser dividido por 100). A resolução deste problema é efetuada inicializando-se a variável através de uma das formas:

```advpl

Local nPercentual, nResultado
nPercentual := 10
nResultado := 250 * (1 + (nPercentual / 100))

```

ou

```advpl

Local nPercentual := 10, nResultado
nResultado := 250 * (1 + (nPercentual / 100))

```

A diferença, entre o último exemplo e os dois anteriores, é que a variável é inicializada no momento da declaração. Em ambos os exemplos, a variável é primeiro declarada e então inicializada em uma outra linha de código. É aconselhável optar pelo operador de atribuição composto de dois pontos e sinal de igual, pois o operador de atribuição, utilizando somente o sinal de igual, pode ser facilmente confundido com o operador relacional (para comparação), durante a criação do programa.

## Operações com Variáveis

Uma vez que um valor lhe seja atribuído, o tipo de dado de uma variável é igual ao tipo de dado do valor atribuído. Ou seja, uma variável passa a ser numérica se um número lhe é atribuído, passa a ser caractere se uma string de texto lhe for atribuída etc. Porém, mesmo que uma variável seja de determinado tipo de dado, pode-se mudar o tipo da variável atribuindo outro tipo a ela:

```advpl

01 Local xVariavel // Declara a variável inicialmente com valor nulo
02 
03 xVariavel := "Agora a variável é caractere..."
04 Alert("Valor do Texto: " + xVariavel)
05 
06 xVariavel := 22 // Agora a variável é numérica
07 Alert(cValToChar(xVariavel))
08
09 xVariavel := .T. // Agora a variável é lógica
10 If xVariavel
11 Alert("A variável tem valor verdadeiro...")
12 Else
13 Alert("A variável tem valor falso...")
14 Endif
15
16 xVariavel := Date() // Agora a variável é data
17 Alert("Hoje é: " + DtoC(xVariavel))
18 
19 xVariavel := nil // Nulo novamente
20 Alert("Valor nulo: " + xVariavel)
21
22 Return


```

No programa de exemplo anterior, a variável xVariavel é utilizada para armazenar diversos tipos de dados. A letra "x", em minúsculo no começo do nome, é utilizada para indicar uma variável que pode conter diversos tipos de dados, segundo a Notação Húngara (consulte documentação específica para detalhes). Este programa troca os valores da variável e exibe seu conteúdo para o usuário através da função ALERT(). Essa função recebe um parâmetro que deve ser do tipo string de caractere, por isso, dependendo do tipo de dado da variável xVariavel, é necessário fazer uma conversão antes.

Apesar dessa flexibilidade de utilização de variáveis, devem-se tomar cuidados na passagem de parâmetros para 
funções ou comandos, e na concatenação (ou soma) de valores. Note a linha 20 do programa de exemplo. Quando 
esta linha é executada, a variável xVariavel contém o valor nulo. A tentativa de soma de tipos de dados diferentes gera erro de execução do programa. Nesta linha do exemplo, ocorrerá um erro com a mensagem "type mismatch on +".

Excetuando-se o caso do valor nulo, para os demais devem ser utilizadas funções de conversão, quando é necessário concatenar tipos de dados diferentes (por exemplo, nas linhas 07 e 17).
Note também que quando uma variável é do tipo de dado lógico, ela pode ser utilizada diretamente para checagem 
(linha 10):

```advpl

If xVariavel

//é o mesmo que
If xVariavel = .T.

```

Ou seja, a variável lógica pode ser utilizada diretamente em uma expressão de comparação, sem a necessidade de testar se é verdadeira ou falsa.


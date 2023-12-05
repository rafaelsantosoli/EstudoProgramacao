# Blocos de código

Blocos de código são trechos de código que podem ser executados em conjunto. Em outras linguagens de programação são similares a "funções anônimas" ou "funções lambdas".

Em advpl os blocos de código são definidos ao tipo de dados "codeblock", correspondente ao tipo de variável "B" (block).

## Diferenças entre funções e Blocos de Código

Uma função criada eu um código AdvPL pode ter nenhum, um ou mais parâmetros, e podem ou não ter um valor de retorno. E, no código dessa função, podemos escrever um programa complexo, usando outras funções, operadores, expressões e comandos da linguagem. Loops ( FOR ... NEXT, WHILE ... END ), desvios condicionais ( IF .. ELSEIF ... ELSE ... ENDIF / CASE ... END CASE ), enfim, tudo o que o AdvPL nos oferece.

Um bloco de código é uma forma de criar uma função anônima, que pode receber ou não parâmetros, o código a ser executado pode ser uma expressão AdvPL, ou mais de uma expressão ( lista de expressões ), executadas sequencialmente. As expressões são limitadas a funções e operadores da linguagem, mas não permitem comandos... E, implicitamente, o retorno de uma execução de um Bloco de Código é sempre o resultado da expressão executada – e no caso de mais de uma instrução, o retorno é o resultado da última expressão do bloco.

## Estrutura e declaração de um Bloco de Código

Um bloco de código é declarado com a palavra reservada "codeblock", seguida de um par de parênteses, que podem ou não conter uma lista de parâmetros, e um par de chaves, que contém o código a ser executado.

{ | [parametros,...] | [expressão,...] }

O Bloco de código é iniciado pela abertura de chaves `"{"`, seguido sempre de dois `'|"` ( pipes ), onde entre eles podemos identificar nenhum, um ou mais nomes de variáveis que receberão os parâmetros de chamada informados, e entre o segundo "|" e o fechamento do bloco "}", podemos especificar uma ou mais expressões Advpl, separadas por vírgula, a serem executadas. O retorno do bloco sempre será a última expressão executada. Caso um bloco de código não tenha expressão ( chamamos de BLOCO VAZIO ), o retorno será NIL. Os nomes de variáveis declarados como parâmetros do Bloco de Código tem o escopo mais restrito do AdvPL, somente são visíveis dentro do corpo das expressões do bloco.  

## Exemplo Didático entre Função e Bloco de Código

Vamos partir de uma função simples, mostrando como ela pode ser escrita  e usada como um bloco de código.

```Advpl

Static Function SomaAbs( n1, n2 )
Local nr

conout("N1 = ",n1)
conout("N2 = ",n2)
nr := abs(n1) + abs(n2)

return nr

```

A função acima recebe dois valores, registrando no console do servidor de aplicação uma mensagem para cada valor recebido, faz a soma dos valores absolutos ( positivos ) dos números informados, e retorna esse valor. Para chamar a função, eu usaria algo como :

```Advpl

User function SomaTst1()
local x

x := SomaAbs( 10 , -20 )
conout("Resultado",x)

return

```

Essas mesmas operações podem ser escritas em um bloco de código , de apenas uma linha, que fará exatamente a mesma coisa que a função SomaAbs():
    
```Advpl

User Function Somatst2()
Local bBloco1 , x
Local x

bBloco1 := { |n1,n2| conout("N1 = ",n1) , conout("N2 = ",n2) , abs(n1) + abs(n2) }

x := Eval( bBloco1 , 10 , -20 )

conout("Resultado",x)

return

```

O bloco de codigo usa os delimitadores de abertura e fechamento de chave "{}", junto de dois identificadores "|" (pipe), usados para identificar e delimirar a lista de parâmetros, seguido por uma ou mais expressões AdvPL a serem executadas -- da esquerda para a direita. Armzenamos o bloco de código na variável bBloco1 , e usamos a função EVAL() para executar o bloco, passando parametros e obtendo o retorno.

Veja abaixo mais alguns exemplos de bloco de código :
    
```Advpl

{ || } // Bloco de codigo vazio. Nao recebe parametros, retorna NIL -- não faz "nada", mas é um Bloco de Código
{ || .T. } // Bloco de código sem parametros, retorna sempre o valor lógico ".T." ( verdadeiro )
{ |p1,p2| p1 < p2 } // Bloco de codigo com dois parametros (p1 e p2), retorna .T. se o primeiro parametro é menor que o segundo
{ |a,c,b| IIF( a>b , c , 0 ) } // Bloco de codigo com 3 parametros, se o primeiro for maior que o segundo, retorna o terceiro, senão retorna 0

```

E, algumas coisas que NÃO SAO blocos de código

```Advpl

{ .t. } // Isso é um array , de um elemento, com conteúdo lógico verdadeiro ".T."
{ IIF( 1<2 , "menor", "maior" ) } // Isso é um array, com um elemento, com o conteúdo retornado pela expressão "IIF()" utilizada.

```

## Utilizando Blocos de Código - Exemplo aSort()

Blocos de código podem ser utilizados em diversas situações. Geralmente são utilizados para executar tarefas quando eventos de objetos são acionados. Por exemplo, considere a matriz abaixo:

    A := {"CARLA", "ANDREA", "BEATRIZ"}

Esta matriz pode ser ordenada pelo primeiro nome, utilizando-se a chamada da função ASort(A), resultando na matriz com os elementos ordenados dessa forma:

    {"ANDREA", "BEATRIZ", "CARLA"}

A ordem padrão para a função ASort é ascendente. Este comportamento pode ser modificado através da informação de um bloco de código que ordena a matriz de forma descendente:

    B := { |X, Y| X > Y }
    aSort(A ,,, B)

O bloco de código utilizado neste exemplo (de acordo com a documentação da função ASort()) deve ser escrito para aceitar dois parâmetros, que são os dois elementos da matriz para comparação. Observe que o bloco de código não conhece que elemento está comparando - a função aSort() seleciona os elementos e passa-os para o bloco de código. O bloco de código compara-os e retorna verdadeiro (.T.) se encontram na ordem correta, caso contrário retorna falso (.F.). A função ASort() executará quantas chamadas forem necessárias para ordenar o array até que a sequência de elementos esteja devidamente ordenada.

## Utilização Avançada de Blocos de Código

É possivel criar um bloco de código dinamicamente no AdvPL, utilizando-se do operador de macro-execução, bem como chamar de dentro de um bloco de código qualquer função da linguagem AdvPL e funções compiladas no repositório. Estes recursos possuem algumas particularidades de uso, exploradas nos exemplos abaixo.

### Exemplo 01 : Bloco de código referenciando variável local

```Advpl

USER FUNCTION BL001()

Local nContador := 0
Local bIncr := {  | i | nContador := nContador + i }

conout("Antes : " + str( nContador , 5 ))
BLCONTA( bIncr )
conout("Depois : " + str( nContador , 5 ))

Return


STATIC FUNCTION BLCONTA( bBloco )

Eval( bBloco ,  5 )

Return

```

Após executar a função  U_BL001(), o resultado obtido no log de console do Application Server será : 

**Antes: 0**
**Depois: 5**

Repare que a variável nContador foi declarada no escopo LOCAL da função BL001. A princípio, por ser uma variável local, apenas instruções dentro da função BL001 poderiam acessar ou alterar este valor, ou o conteúdo desta variável poderia ser passado por referência para uma outra função. No exemplo, esta variável foi usada dentro de um bloco de código, onde o bloco atualiza o conteúdo da variável com o conteúdo atual somado ao parâmetro recebido pelo bloco de código. O bloco de código foi passado como parâmetro para outra função, onde dentro dela foi feita a chamada deste bloco através da função Eval(), informando o parâmetro numérico 5 . Ao ser executado o bloco de código, a variável nContador referenciada dentro do bloco de código será atualizada. Quando a função retorna, e consultamos o conteúdo de nContador, vemos que ele foi atualizado para o número 5.

### Exemplo 02 : Bloco de código com parâmetros por referência

```Advpl

USER FUNCTION BL002()
Local bTeste := { |x| x := x + 1 , u_mostra(x)   }
 
Local nContador := 0
// retorna NIL , mostra valor 1, chamada passando apenas nContador
 
Eval( bTeste , nContador )
// nContador continua com 0 ( zero ) 
 
conout( " Contador = " + str( nContador,10 ))
// retorna NIL , mostra valor 1, chama passando nContador por referência
 
Eval( bTeste , @nContador )
// Mas agora o nContador está com 1 ( um )
 
conout( " Contador = " + str( nContador,10 ))
 
Return
 
User Function Mostra(nValor)
conout( "Valor = " + str( nValor , 10) )
Return

```

Neste exemplo, o bloco de código não referência explicitamente a variável nContador. Na verdade, ele recebe um parâmetro em x, usa o proprio parâmetro x para receber o resultado da soma dele mesmo com o numero 1, e chama uma função de usuário ( U_MOSTRA ), para mostrar o conteúdo de x. Os parâmetros de um bloco de código são como os parâmetros de uma função AdvPL normal: São todos considerados locais dentro do bloco de código. Da mesma forma que uma função AdvPL, ao passar uma variável com um conteúdo string, data, numérico ou booleano para uma função, a função recebe uma cópia do conteúdo desta variável, de modo que uma alteração na variável que recebe o parâmetro não reflete na variável usada na chamada. Porém, é possível passar um parâmetro por referência a uma função, e se a variável que recebe este parâmetro é alterada dentro da função, esta alteração é refletida na variável original usada na chamada da função. Esta mesma regra é válida para um bloco de código, onde podemos passar por referência um ou mais parâmetros na chamada da função Eval(), reproduzindo o mesmo comportamento.

## Dicas Importantes / Informações Adicionais / Boas Práticas

- Praticamente todos os componentes visuais do AdvPL recebem blocos de código como parâmetro para executar ações de componentes. Eles flexibilizam a linguagem, permitindo que não exista a necessidade de se criar uma função para pequenas ações ou sequencias de ações.  

- Uma chamada de função dentro de um bloco de código, pode conter uma chamada para uma STATIC FUNCTION. Porém, como podemos passar um bloco de código para uma função de outro fonte e executar o Eval() em outra pilha de execução, e fontes diferentes podem conter uma função STATIC com o mesmo nome, o comportamento será indeterminado, isto é, não é possível afirmar qual das funções será chamada, e este comportamento pode mudar dependendo da ordem de execução do bloco de código. É fortemente não recomendado que um bloco de código seja criado com chamada de função de escopo estático.

- É boa prática de uso de blocos de código evitar  a troca de contexto de um bloco de código para níveis superiores da pilha de chamadas AdvPL. Um bloco de código trafegado na pilha de chamadas leva consigo uma área de memoria correspondente ao ambiente de escopo local da pilha de chamadas no momento da declaração do bloco de código (para bloco de codigo estático), ou da criação do bloco de código na memória (para bloco de código dinâmico criado com macro-execução). Caso o bloco de código seja trafegado para um nível superior da pilha de execução de funções AdvPL e armazenado neste nível (por exemplo, guardado em uma variável de escopo estático - STATIC ), a memória alocada para levar o bloco de código e o contexto de criação somente será liberada automaticamente pelo servidor de aplicação quando o programa for finalizado, ou manualmente caso a variável usada para armazenar o bloco de código receba o conteúdo NIL, e o bloco de código em si não seja mais referenciado em nenhum outro ponto da aplicação em tempo de execução. 

- Um bloco de código deve obedecer aos requisitos para o qual o mesmo foi criado. Uma função projetada para receber um bloco de código como argumento provavelmente vai, em algum momento, chamar a execução deste bloco. A passagem de parâmetros e retorno esperados do bloco são informações que devem ser providas na documentação da função que está realizando a chamada, para que o desenvolvedor saiba o que ele receberá quando o bloco for executado, sob que contexto originalmente a aplicação fará a execução do bloco de codigo, e qual é o retorno esperado para o bloco de código. 

Importante:
Seguindo as boas práticas de programação AdvPL, a utilização de um bloco de código pode facilitar muito o desenvolvimento de uma aplicação, mas não é uma solução que serve para todos os problemas. Um bloco de código muito grande ou muito amarrado pode tornar mais difícil a manutenção e a depuração de um código. Se o bloco de código ficar muito extenso, e existe a real necessidade de utilizá-lo, ao invés de colocar 4 KB de expressões dentro de apenas um bloco de código, escreva uma função que atenda a necessidade da aplicação, e use o bloco de código para realizar a chamada da função. No resumo, use quando necessário, onde for necessário. 
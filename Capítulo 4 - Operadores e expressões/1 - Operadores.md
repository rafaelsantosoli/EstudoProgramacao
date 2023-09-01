# <h2 style="color: dodgerblue">Operadores </a>

Operadores são elementos funcionais que atuam sobre termos (também chamados de operandos) e produzem um determinado resultado.

Os operadores são, na prática, instruções especiais pelas quais incrementamos, decrementamos, comparamos e avaliamos dados dentro de um programa de computador. Podemos classificar os operadores em três classes:

- <a style="color: dodgerblue"> Operadores Aritméticos;</a> 
- <a style="color: dodgerblue ">Operadores Relacionais;</a> 
- <a style="color: dodgerblue ">Operadores Lógicos.</a> 


Com o uso de operadores é possível construir expressões, assim como na matemática. A complexidade de uma expressão é determinada pela quantidade de operadores e termos (variáveis ou valores constantes). De acordo com o número de termos sobre os quais os operadores atuam, podemos classificá-los em:

## <h2 style="color: dodgerblue"> Operadores Unários  </a>

Unários atuam sobre um único termo. Esta operação é chamada de monódica. Como exemplo, temos os operadores aritméticos básicos: adição, subtração, multiplicação e divisão.

Exemplo:

```Javascript

var a = -10;

```

## <h2 style="color: dodgerblue">Operadores Binários</a>

Binários atuam sobre dois termos. Esta operação é chamada de diadema. Como exemplo, podemos citar os operadores aritméticos (+, -, *, /, %), os operadores relacionais (==, !=, >, <, >=, <=) e os operadores lógicos (&&, ||);

Exemplo:

```Javascript

var a = 10 + 20;

```

## <h2 style="color: dodgerblue">Operadores Ternários</a>

Ternários atuam sobre três termos. Esta operação é chamada de triádica. Como exemplo, podemos citar o operador condicional (condição) ? valor1 : valor2

Este operador pode ser útil em situações em que desejamos atribuir a uma variável, valores diferentes de acordo com determinada condição.

Exemplo:

```javascript

var a = 10 > 20 ? 10 : 20;

// A recebe 20, se 10 for maior que 20, caso contrário, recebe 10.

```

Referências: [O operador condicional ternário](http://www.nce.ufrj.br/ginape/js/conteudo/decisao/ternario.htm)

## <h2 style="color: dodgerblue">Operadores Aritméticos</a>

Os operadores aritméticos são utilizados para obter resultados numéricos. Além da adição, subtração, multiplicação e divisão, grande parte das linguagens de programação também disponibilizam o operador para a operação de exponenciação. Os símbolos para os operadores aritméticos estão listados na tabela a seguir:
![Operadores aritméticos](./Imagens/operadores_aritmeticos.png)

A prioridade entre operadores define a ordem em que os mesmos devem ser avaliados dentro de uma mesma expressão, ou seja, operadores de prioridade menor serão avaliados primeiro.

Via de regra, as expressões devem ser calculadas da esquerda para a direita, obedecendo a prioridade descrita na tabela acima. Se existirem expressões dentro de parênteses, estas terão prioridade sobre os demais operadores.

É importante salientar que maioria das linguagens de programação o tipo de dado resultante depende dos tipos de dados dos termos envolvidos na expressão. Por exemplo, se um dos termos for do tipo string, o resultado será uma concatenação de strings. Se um dos termos for do tipo float, o resultado será um float. Se um dos termos for do tipo inteiro, o resultado será um inteiro.

![Operadores aritméticos](./Imagens/Resultado_operadores1.png)
![Operadores aritméticos](./Imagens/Resultado_operadores2.png)

Exemplo:

```Python

a = 10 + 20; # O resultado será do tipo inteiro com valor 30

b = 10 + 20.0; # O resultado será do tipo float com valor 30.0

c = "10" + "20"; # O resultado será do tipo string com valor "1020"

```

## <h2 style="color: dodgerblue">Operadores Relacionais</a>

Os operadores relacionais são utilizados para comparar dois valores. O resultado de uma expressão relacional é sempre um valor lógico (verdadeiro ou falso). Os símbolos para os operadores relacionais estão listados na tabela a seguir:

![Operadores relacionais](./Imagens/Operadores%20relacionais.png)

Estes operadores são somente usados quando se deseja efetuar comparações. Comparações só podem ser feitas entre objetos de mesma natureza, isto é, variáveis do mesmo tipo de dado. O resultado de uma comparação é  sempre um valor lógico. Se a comparação for verdadeira, o resultado será true, caso contrário, false.

Exemplo:

```Python

a = 10 > 20; # O resultado será false

b = 10 < 20; # O resultado será true

c = 10 == 20; # O resultado será false

d = 10 != 20; # O resultado será true

e = "10" == "20"; # O resultado será false

```

Com valores string, os operadores relacionais comparam os valores ASCII dos 
caracteres correspondentes em cada string. Uma string é dita “menor que” 
outra se os caracteres correspondentes tiverem os números de códigos ASCII 
menores. Por exemplo:

```Python

"abc" < "def" # O resultado será true

"abc" < "ab" # O resultado será false

"abc" < "abd" # O resultado será true

"algoritmo" > "ALGORITMO" # O resultado será true

"ABC" < "EFG" # O resultado será true

"Pascal" < "Pascal competir" # O resultado será true

```

`ASCII` (American Standard Code for Information Interchange) é um código de caracteres de 7 bits, que permite a representação de 128 caracteres. O código ASCII é utilizado para representar letras, números, sinais de pontuação e outros caracteres especiais. O código ASCII é um padrão internacional, utilizado por todos os computadores para a representação de caracteres.
[Tabela ASCII](https://www.ime.usp.br/~pf/algoritmos/apend/ascii.html)

Dica: Utilizando o atalho `Alt + 65` no teclado numérico, você pode digitar o caractere `A` maiúsculo. Para digitar o caractere `a` minúsculo, utilize o atalho `Alt + 97`.

Vale ressaltar que não é eficaz comparar valores do tipo real com os operadores de igualdade em virtude de a representação em ponto flutuante ser inexata em alguns casos.

Apesar de algebricamente correta, a expressão (1.0/3.0) + (1.0/3.0) + (1 .0/3.0) = 1 é avaliada como falsa devido ao fato de 1.0/3.0 ter como resultado um valor que contém número infinito de casas decimais (3.3333333 ...). O computador é apenas capaz de utilizar um número finito de casas decimais e, portanto, é feito um arredondamento do valor de 1/3 em cada ocorrência. Para evitar os erros causados pela representação inexata de valores reais, deve-se evitar utilizar as comparações de igualdade com números reais.

Exemplo:

```Python

a = 1.0/3.0 + 1.0/3.0 + 1.0/3.0;

b = 1;

c = a == b; # O resultado será false

```

## <h2 style="color: dodgerblue">Operadores Lógicos</a>

## <h2 style="color: dodgerblue">Operador de concatenação</a>

## <h2 style="color: dodgerblue">Operador de atribuição</a>
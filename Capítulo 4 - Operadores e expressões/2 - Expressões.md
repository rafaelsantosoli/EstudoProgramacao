# Expressões

## Índice



## Conceito de expressão

O conceito de expressão, em termos computacionais, está intimamente ligado ao conceito de expressão (ou fórmula) usado na matemática, na qual 
um conjunto de variáveis e constantes numéricas relaciona-se por meio de operadores aritméticos compondo uma fórmula que, uma vez avaliada, resulta em um valor final.

O conceito de expressão aplicado à computação assume um sentido mais amplo: uma expressão é uma combinação de variáveis, constantes e operadores (aritméticos, relacionais ou lógicos) e que, uma vez avaliada, resulta 
em um valor.

## Expressões aritméticas

Expressões aritméticas são aquelas cujo resultado da avaliação é do tipo numérico, seja ele inteiro ou real. Somente o uso de operadores aritméticos, 
variáveis numéricas e parênteses é permitido em expressões deste tipo.

Exemplos de expressões aritméticas:

```javascript

let a = 10;
let b = 20;
let c = 30;

let d = a + b + c;

let e = (a + b) * c;

let f = a * b + c;

```

Em python, os operadores aritméticos são escritos como palavras reservadas:

```python

a = 10
b = 20
c = 30

d = a + b + c

e = (a + b) * c

f = a * b + c

```

## Expressões lógicas

Expressões lógicas são aquelas cujo resultado da avaliação é um valor lógico verdadeiro ou falso. Nestas expressões são usados os operadores relacionais e os operadores lógicos, podendo ainda serem combinados com expressões aritméticas. Quando forem combinadas duas ou mais expressões que utilizem operadores relacionais e lógicos, os mesmos devem utilizar os parênteses para indicar a ordem de precedência.

Exemplos de expressões lógicas:

```javascript

let a = 10;
let b = 20;
let c = 30;

let d = a > b; // false

let e = (a > b) && (b > c); // false

let f = (a > b) || (b > c); // false

let g = (a > b) || (b < c); // true

```

Em python, os operadores lógicos são escritos como palavras reservadas:

```python

a = 10

b = 20

c = 30

d = a > b # false

e = (a > b) and (b > c) # false

f = (a > b) or (b > c) # false

g = (a > b) or (b < c) # true

```

## Expressões de atribuição

Expressões de atribuição são aquelas cujo resultado da avaliação é uma variável. Nestas expressões são usados os operadores de atribuição, podendo ainda serem combinados com expressões aritméticas e lógicas. Quando forem combinadas duas ou mais expressões que utilizem operadores de atribuição, os mesmos devem utilizar os parênteses para indicar a ordem de precedência.

Exemplos de expressões de atribuição:

```javascript

let a = 10;

let b = 20;

let c = 30;

let d = a + b + c;

let e = (a + b) * c;

let f = a * b + c;

```

Em python, os operadores de atribuição são escritos como palavras reservadas:

```python

a = 10

b = 20

c = 30

d = a + b + c

e = (a + b) * c

f = a * b + c

```

## Expressões de avaliação

Expressões que apresentam apenas um único operador podem ser avaliadas diretamente. No entanto, à medida que as mesmas vão tornando-se mais complexas com o aparecimento de mais de um operando na mesma expressão, é necessária a avaliação da mesma passo a passo, tomando um operador por vez. A sequência destes passos é definida de acordo com o formato geral da expressão, considerando-se a prioridade (precedência) de avaliação de seus operadores e a existência ou não de parênteses na mesma.

As seguintes regras são essenciais para a correta avaliação de expressões:

1. Deve-se observar a `prioridade dos operadores`, conforme mostrado nas tabelas de operadores: operadores de maior prioridade devem ser avaliados primeiro. Se houver empate com relação à precedência, então a avaliação se faz da `esquerda para a direita`.
2. Os `parênteses` usados em expressões têm o poder de `“roubar”` prioridade dos demais operadores, forçando a avaliação da sub-expressão em seu interior.
3. Entre os três grupos de operadores existentes, a saber: aritmético, lógico e relacional, há certa prioridade de avaliação: os operadores aritméticos devem ser avaliados primeiro; a seguir, são avaliadas as sub-expressões com operadores relacionais e, por último os operadores lógicos são avaliados.

Tabela de prioridade de operadores aritméticos:

| Operador | Tipo | Operação | Prioridade |
|----------|------|----------|------------|
| + | Binário | Adição | 4 |
| - | Binário | Subtração | 4 |
| * | Binário | Multiplicação | 3 |
| / | Binário | Divisão | 3 |
| % ou MOD | Binário | Resto da divisão | 3 |
| Div | Binário | Divisão inteira | 3 |
| ** ou ^ | Binário | Exponenciação | 2 |
| + | Unário | Sinal positivo | 1 |
| - | Unário | Sinal negativo | 1 |

Tabela de prioridade de operadores lógicos:

| Operador | Operação | Prioridade |
|----------|----------|------------|
| NOT | Negação lógica | 1 |
| AND | Conjunção lógica | 2 |
| OR | Disjunção lógica | 3 |

Tabela de prioridade de operadores relacionais:

| Operador | Operação | Prioridade |
|----------|----------|------------|
| = | Igualdade | 4 |
| <>| Diferença | 4 |
| < | Menor que | 4 |
| > | Maior que | 4 |
| <= | Menor ou igual | 4 |
| >= | Maior ou igual | 4 |

Tabela de prioridade de avaliação de operadores:

| Operador | Prioridade |
|----------|------------|
| Aritméticos | 1 |
| Relacionais | 2 |
| Lógicos | 3 |

Tabela Completa de prioridade de avaliação de operadores:

| Operador | Operação | Prioridade |
|----------|----------|------------|
| + | Adição | 4 |
| - | Subtração | 4 |
| * | Multiplicação | 3 |
| / | Divisão | 3 |
| % ou MOD | Resto da divisão | 3 |
| Div | Divisão inteira | 3 |
| ** ou ^ | Exponenciação | 2 |
| + | Sinal positivo | 1 |
| - | Sinal negativo | 1 |
| = | Igualdade | 4 |
| <>| Diferença | 4 |
| < | Menor que | 4 |
| > | Maior que | 4 |
| <= | Menor ou igual | 4 |
| >= | Maior ou igual | 4 |
| NOT | Negação lógica | 1 |
| AND | Conjunção lógica | 2 |
| OR | Disjunção lógica | 3 |
| ( ) | Parênteses | 0 |

A ordem de avaliação de uma expressão e seus operadores em uma linguagem de programação é um conceito importante para entender como os valores e as operações são processados em uma expressão. Existem dois principais tipos de ordem de avaliação: a ordem de precedência dos operadores e a ordem de avaliação dos operandos.

Ordem de Precedência dos Operadores:

A ordem de precedência dos operadores define a prioridade de cada operador em relação aos outros. Isso significa que alguns operadores têm precedência sobre outros e serão avaliados antes.
Em muitas linguagens de programação, os operadores aritméticos têm uma ordem de precedência comum. Por exemplo, em muitas linguagens, a multiplicação (*) e a divisão (/) têm maior precedência do que a adição (+) e a subtração (-). Isso significa que as operações de multiplicação e divisão são avaliadas antes das operações de adição e subtração.
Parênteses podem ser usados para alterar a ordem de precedência, forçando a avaliação de uma parte específica da expressão antes das outras.

Por exemplo, na expressão `2 + 3 * 4`, a multiplicação tem precedência sobre a adição, então a expressão é avaliada como `2 + (3 * 4)`, resultando em 14.
Ordem de Avaliação dos Operandos:

A ordem de avaliação dos operandos se refere à sequência em que os valores ou expressões são avaliados dentro de um operador.
Na maioria das linguagens de programação, os operandos são avaliados da esquerda para a direita. Isso significa que, em uma expressão como `a + b + c`, primeiro a e b são avaliados e somados, e depois o resultado é somado a c.
No entanto, algumas linguagens podem ter regras diferentes para a ordem de avaliação dos operandos. É importante consultar a documentação da linguagem específica para entender as regras exatas.
Em resumo, a ordem de avaliação de uma expressão é determinada pela ordem de precedência dos operadores e pela ordem de avaliação dos operandos, seguindo as regras estabelecidas pela linguagem de programação em uso. É importante entender essas regras para garantir que as expressões sejam avaliadas corretamente e produzam os resultados desejados.

Exemplos de avaliação de expressões:

Avaliação de expressões aritméticas

```javascript

let a = 10;

let b = 20;

let c = 30;

let d = a + b + c; // 60

let e = (a + b) * c; // 900

let f = a * b + c; // 230
```

Avaliação de expressões lógicas

```javascript

let a = 10;

let b = 20;

let c = 30;

let d = a > b; // false

let e = (a > b) && (b > c); // false

let f = (a > b) || (b > c); // false

```

Avaliação de expressões logicas e aritméticas

```javascript

let a = 10;

let b = 20;

let c = 30;

let d = (a + b) > c; // false

let e = (a + b) > c && (a > b); // false

let f = (a + b) > c || (a > b); // true

```

Avaliação de expressões de atribuição

```javascript

let a = 10;

let b = 20;

let c = 30;

let d = a + b + c; // 60

let e = (a + b) * c; // 900

let f = a * b + c; // 230

```

## Erros comuns na avaliação de expressões

A avaliação de expressões em programação pode ser suscetível a diversos erros comuns, que podem afetar o resultado ou o funcionamento do código. Aqui estão alguns erros comuns na avaliação de expressões:

1. Ordem de Precedência dos Operadores Mal Entendida: Não entender a ordem de precedência dos operadores pode levar a resultados incorretos. Por exemplo, misturar operadores aritméticos sem considerar sua prioridade pode causar resultados inesperados.

Exemplo de erro:

```javascript

let result = 2 + 3 * 4; // Se não entender a precedência, pode-se esperar um resultado de 20 em vez de 14.

```

2. Esquecimento de Parênteses: Não usar parênteses quando necessário pode levar a erros de precedência ou de avaliação. Os parênteses são usados para forçar a ordem de avaliação.

Exemplo de erro:

```javascript

let result = 2 + (3 * 4); // Usar parênteses para garantir a precedência correta. O resultado é 14.

```

3. Divisão por Zero: Dividir por zero é um erro comum que pode causar falhas no programa. A maioria das linguagens de programação não permite a divisão por zero e lançará um erro se isso ocorrer.

Exemplo de erro:

```javascript

let result = 2 / 0; // Dividir por zero é um erro comum que pode causar falhas no programa.

```
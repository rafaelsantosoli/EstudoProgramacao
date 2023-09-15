# Variáveis e constantes

## Índice

- [Variáveis e constantes](#variáveis-e-constantes)
  - [Índice](#índice)
  - [Armazenamento de dados na memória](#armazenamento-de-dados-na-memória)
  - [Conceito e utilidade de variáveis](#conceito-e-utilidade-de-variáveis)
  - [Definição de variáveis em algoritmos](#definição-de-variáveis-em-algoritmos)
  - [Conceito e utilidade de constantes](#conceito-e-utilidade-de-constantes)
  - [Referências](#referências)

## Armazenamento de dados na memória

Para armazenar os dados na memória, imagine que a memória de um computador é um grande arquivo com várias gavetas, onde cada gaveta pode armazenar apenas um único valor (seja ele numérico, caractere ou lógico).
Se é um grande arquivo com várias gavetas, é necessário identificar com um nome a gaveta que se pretende utilizar. Desta forma o valor armazenado pode ser utilizado a qualquer momento.

## Conceito e utilidade de variáveis

Têm-se como definição de variável tudo aquilo que é sujeito a variações, que é incerto, instável ou inconstante. E quando se fala de computadores, temos que ter em mente que o volume de informações a serem tratadas é grande e diversificado. Desta forma, os dados a serem processados serão bastante variáveis.

O computador, para poder trabalhar com alguma dessas informações, seja para ler seu conteúdo ou alterá-lo, precisa saber exatamente onde, na memória, o dado está localizado. Fisicamente, cada gaveta ou, cada posição de memória – esse é o termo técnico correto – possui um endereço, ou seja, um número que indica o seu endereço na memória, em outras palavras, onde cada informação está localizada. Esse número é normalmente representado usando notação hexadecimal, tendo o tamanho de quatro ou mais bytes – dependendo da arquitetura do computador.

Exemplo:

![Endereços Físicos](./Imagens/Endereços%20Físicos.png)

O endereçamento das posições de memória por meio de números hexadecimais é perfeitamente compreendido pela máquina, mas para nós humanos torna-se uma tarefa complicada.

Para resolver esse problema, as linguagens de computador facilitam o manuseio, por parte dos programadores, das posições de memória da máquina, permitindo que, ao invés de trabalhar diretamente com os números hexadecimais, seja possível atribuir nomes diferentes a cada posição de memória. Além disso, tais nomes são de livre escolha do programador. Com esse recurso, os usuários ficaram livres dos endereços em hexadecimal e passam a trabalhar com endereços lógicos. 

Como o conteúdo de cada gaveta (endereço lógico) pode variar, ou seja, mudar de valor ao longo da execução do programa convencionou-se chamar de `variável` a referência a cada gaveta.

Assim, para os exemplos de endereços físicos mostrados anteriormente, poderíamos rotular a posição de memória `7000:A210` como `nome` e, como isso, sempre que precisássemos do valor dessa posição de memória, bastaria referenciar a variável `nome`.

Exemplo:
![Endereços Físicos](./Imagens/Endereços%20Fisicos2.png)

Basicamente, uma variável possui três atributos: um `nome`, um `tipo de dado` associado à mesma e a `informação` por ela guardada. Toda variável possui um nome que tem a função de diferenciá-la das demais. Cada linguagem de programação estabelece suas próprias regras de formação de nomes de variáveis. Todavia a maioria delas adota as seguintes regras:

- um nome de variável deve necessariamente começar com uma letra;
- um nome de variável não deve conter nenhum símbolo especial, exceto a sublinha ( _ ) e nenhum espaço em branco;
- um nome de variável não poderá ser uma palavra reservada a uma instrução de programa.

Exemplos de nomes de variáveis válidos:

- `nome`
- `idade`
- `altura`
- `peso`

Exemplos de nomes de variáveis inválidos:

- `nome completo`
- `nome-completo`
- `nome/completo`
- `_nome_completo_`
- `1nome`

É interessante adotar nomes de variáveis relacionados às funções que serão exercidas pelas mesmas dentro de um programa. Outro atributo característico de uma variável é o tipo de dado que ela pode armazenar. Este atributo define a natureza das informações contidas na variável. Por último há o atributo informação, que nada mais é do que a informação útil contida na variável.

Uma vez definidos, os atributos nome e tipo de dado de uma variável não podem ser alterados e assim permanecem durante toda a sua existência, desde que o programa que a utiliza não seja modificado. Por outro lado, o atributo informação está constantemente sujeito a mudanças de acordo com o fluxo de execução do programa.

## Definição de variáveis em algoritmos

Todas as variáveis utilizadas em algoritmos devem ser definidas antes de serem utilizadas. Isto se faz necessário para permitir que o compilador reserve um espaço na memória para as mesmas. Mesmo que algumas linguagens de programação (como BASIC e FORTRAN) dispensam esta definição, uma vez que o espaço na memória é reservado à medida que novas variáveis são encontradas no decorrer do programa.

- Exemplo de declaração de variáveis em python:

```python

nome = "João"
idade = 20
altura = 1.75
peso = 80.5
data_nascimento = "01/01/2000"
sexo = "M"
```

- Exemplo de declaração de variáveis em javaScript:

```javascript

// var significa "variável"
// Variáveis declaradas com var podem ser alteradas e redeclaradas
var nome = "João";
var idade = 20;
var altura = 1.75;
var peso = 80.5;
var data_nascimento = "01/01/2000";
var sexo = "M";
```

Em javaScript, a partir da versão ES6, é possível declarar variáveis utilizando `let` e `const`:

```javascript

// let significa "deixe" ou "permita"
// Variáveis declaradas com let podem ser alteradas
let nome = "João"; 
let idade = 20;
let altura = 1.75;
let peso = 80.5;
let data_nascimento = "01/01/2000";
let sexo = "M";

// const significa "constante"
// Variáveis declaradas com const não podem ser alteradas
const nome = "João";
const idade = 20;
const altura = 1.75;
const peso = 80.5;
const data_nascimento = "01/01/2000";
const sexo = "M";
```

Não é necessário declarar o tipo de dado da variável em python e javaScript, pois a linguagem é de tipagem dinâmica, ou seja, o tipo de dado é definido no momento em que a variável recebe um valor.

- Exemplo de declaração de variáveis em ADVPL/TLPP:

```advpl
Local cNome := "João"
Local nIdade := 20
Local nAltura := 1.75
Local nPeso := 80.5
Local dDataNascimento := DtoD("01/01/2000")
Local cSexo := "M"
```

Outro exemplo utilizando ADVPL/TLPP:

```advpl
Local cNome as character
Local nIdade as decimal
Local nAltura as double
Local nPeso as double
Local dDataNascimento as date
Local cSexo as character
```

Não é necessário declarar o tipo de dado da variável em ADVPL/TLPP, pois a linguagem é de tipagem dinâmica, ou seja, o tipo de dado é definido no momento em que a variável recebe um valor.

Em ADVPL/TLPP, a declaração de variáveis é feita utilizando a palavra reservada `Local` seguida do nome da variável e do tipo de dado que ela irá armazenar. O tipo de dado pode ser declarado após a palavra reservada `as` ou após o operador de atribuição `:=`.

É importante ressaltar que, em ADVPL/TLPP, o operador de atribuição é o `:=` e não o `=`. O operador `=` é utilizado para comparação de valores.

Exemplo de declaração de variáveis em typescript:

```typescript

let nome: string = "João";
let idade: number = 20;
let altura: number = 1.75;
let peso: number = 80.5;
let data_nascimento: string = "01/01/2000";
let sexo: string = "M";

const nome: string = "João";
const idade: number = 20;
const altura: number = 1.75;
const peso: number = 80.5;
const data_nascimento: string = "01/01/2000";
const sexo: string = "M";
```

A linguagem typescript é de tipagem estática, ou seja, o tipo de dado da variável é definido no momento em que a mesma é declarada.

## Conceito e utilidade de constantes

Têm-se como definição de constante tudo aquilo que é fixo ou estável. Existirão vários momentos em que este conceito deverá estar em uso, quando desenvolvermos programas.

As constantes são muito utilizadas na programação principalmente em situações nas quais temos de referenciar um mesmo valor várias vezes ao longo do programa.

## Referências

[TypeScript: Tipos de dados](https://www.devmedia.com.br/typescript-tipos-de-dados/40741)

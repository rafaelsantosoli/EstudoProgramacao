# Exercícios

## Exercício 1

Sobre o uso de variáveis e constantes em um algoritmo é incorreto afirmar que:

- a) toda informação manipulada diretamente pelo computador é armazenada na memória principal (RAM) e as variáveis representam referências a posições dessa memória;
- b) o valor de uma variável não pode ser alterado ao longo do programa, mantendo o mesmo valor até o encerramento do programa;
- c) o tipo de dado implica na forma como os dados são representados na memória;
- d) os vetores e matrizes só podem manipular dados de um mesmo tipo de dado;

Resposta: b

Vetores e matrizes podem manipular dados de tipos diferentes, desde que sejam do mesmo tipo de dado, por exemplo, um vetor de inteiros e um vetor de reais, ou uma matriz de inteiros e uma matriz de reais.

## Exercício 2

Escolha a alternativa que apresenta, respectivamente, os tipos de dados mais adequados para variáveis que deverão armazenar os seguintes conteúdos: `idade`, `temperatura`, `nome da cidade`, `número da carteira de identidade`, `nota de um aluno`.

- a) Inteiro, real, caractere, caractere, real.
- b) Inteiro, inteiro, caractere, caractere, inteiro.
- c) Inteiro, real, inteiro, caractere, real.
- d) Inteiro, real, real, caractere, inteiro.
- e) Inteiro, real, caractere, real, real.

Resposta: A

## Exercício 3

Assinale com um X os nomes de variáveis válidos

- (X) abc
- ( ) 3abc
- (X) a
- ( ) 123a
- ( ) –a
- (X) acd1
- ( ) -_ad
- ( ) A&a
- ( ) guarda-chuva
- (X) A123
- (X) Aa
- (X) guarda_chuva
- ( ) ABC DE
- ( ) etc.
- (X) b316
- (X) leia
- (X) enquanto
- (X) escreva

Resposta: abc, a, acd1, A123, Aa, guarda_chuva, b316, leia, enquanto, escreva

## Exercício 4

Crie fluxogramas para os seguintes algoritmos:

- a) Ler um número inteiro e imprimir seu sucessor e seu antecessor.
- b) Calcular a média aritmética de 3 notas de um aluno e imprimir a mensagem de aprovado ou reprovado. A média de aprovação é 7.

OBS: Utilize a uma das ferramentas:

- [draw.io](https://app.diagrams.net/)
- [MindMeister](https://www.mindmeister.com/pt)
- [Lucid](https://lucid.co/pt)

Resposta a) e b):

[Diagrama](/Capítulo%203%20-%20Manipuração%20de%20dados/Exemplos/Diagrama.dio)

## Exercício 5

Utilizando linguagem de programação de sua preferência, ou pseudocódigo, escreva um programa que leia o nome, a idade e o sexo de uma pessoa e imprima as informações na tela.

```python

nome = input("Digite seu nome: ")
idade = int(input("Digite sua idade: "))
sexo = input("Digite seu sexo: ")

print("Nome: ", nome)
print("Idade: ", idade)
print("Sexo: ", sexo)

```

```javascript

let nome = prompt("Digite seu nome: ")
let idade = parseInt(prompt("Digite sua idade: "))
let sexo = prompt("Digite seu sexo: ")

console.log("Nome: ", nome)
console.log("Idade: ", idade)
console.log("Sexo: ", sexo)

```

```Psuedo

nome = leia("Digite seu nome: ")
idade = leia("Digite sua idade: ")
sexo = leia("Digite seu sexo: ")

escreva("Nome: ", nome)
escreva("Idade: ", idade)

```
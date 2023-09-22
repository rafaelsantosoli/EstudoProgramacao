# Exercícios de operadores e expressões

## Exercício 1

Assinale a alternativa correta:

- a) O operador > (maior que) pode ser classificado como operador relacional do tipo unário.
- b) O resultado de uma expressão aritmética será um valor lógico.
- c) O resultado de uma expressão lógica sempre será um valor lógico.
- d) Um operador relacional usado para comparar dois números inteiros 
sempre retornará um valor inteiro.
- e) O operador .OU. é classificado com operador lógico do tipo binário e 
tem prioridade sobre os demais operadores lógicos.

Resposta: C

## Exercício 2

Das alternativas apresentadas abaixo indique aquela que não devolve um valor lógico. Considere os seguintes valores para as variáveis: Media = 7, Nota = 7.25, Valor ← verdadeiro e Opção ← “a”.

- a) ((Nota >= Media) E (Opção=”b”))
- b) (((Nota + 1) > Media) OU (NAO Valor))
- c) (((Média*2)-1) MOD 2)
- d) (((Media DIV 7) = 1) OU (Nota >= Media))
- e) (((Nota - Media) > 3) = Valor)

Resposta: C

resolução:

- a) ((7.25 >= 7) E (Opção=”b”)) = (VERDADEIRO E FALSO) = FALSO
- b) (((7.25 + 1) > 7) OU (NAO VERDADEIRO)) = ((8.25 > 7) OU (FALSO)) = VERDADEIRO
- c) (((7*2)-1) MOD 2) = ((14-1) MOD 2) = (13 MOD 2) = 1
- d) (((7 DIV 7) = 1) OU (7.25 >= 7)) = ((1 = 1) OU (VERDADEIRO)) = VERDADEIRO
- e) (((7.25 - 7) > 3) = VERDADEIRO) = ((0.25 > 3) = VERDADEIRO) = VERDADEIRO

## Exercício 3

Qual o valor final das variáveis A e B, após a execução das instruções abaixo ?

- A ← 3
- B ← A*5
- A ← B DIV 2
- B ← A – 10

Resposta: A = 7 e B = -3

Resolução:

- A = 3
- B = 3 * 5 = 15
- A = 15 DIV 2 = 7
- B = 7 - 10 = -3

## Exercício 4

Se X possui o valor 15 e foram executadas as seguintes instruções:

X ← X + 3
X ← X - 6
X ← X / 2
X ← 3 * X

Qual será o valor armazenado em X?

Resposta: 18

Resolução:

- X = 15
- X = 15 + 3 = 18
- X = 18 - 6 = 12
- X = 12 / 2 = 6
- X = 3 * 6 = 18

## Exercício 5

Assinalar os comandos de atribuição considerados inválidos:

var
NOME, COR, TESTE, DIA: caracter
SOMA, NUM: inteiro
Salario: real
X: logico

- a) ( ) NOME ← “5”
- b) (X) SOMA ← NUM + 2 * X
- c) (X) TESTE ← SOMA
- d) ( ) NUM ← SOMA
- e) ( ) COR ← “PRETO”
- f) (X) X ← X + 1
- g) (X) NUM ← “*ABC*”
- h) ( ) DIA ← “SEGUNDA”
- i) (X) SOMA + 2 ← NUM
- j) ( ) X ← (NOME = COR)
- k) ( ) Salario ← 5.000
- l) ( ) Salario ← 150
- m) (X) Salario ← “insuficiente”

Resposta: B, C, F, G, I, M

## Exercício 6

Quais os valores armazenados em SOMA, NOME e TUDO, supondo-se que NUM, X, COR, DIA,TESTE e TESTE2 valem, respectivamente, 5, 2, “AZUL”, “TERÇA”, FALSO e VERDADEIRO?

- a) NOME ← DIA
- b) SOMA ← (NUM**2/X) + (X + 1) 
- c) TUDO ← .NÃO. ((TESTE .OU. TESTE2) .E. (X <> NUM)) 

Resposta:

- NUM = 5
- X = 2
- COR = “AZUL”
- DIA = “TERÇA”
- TESTE = FALSO
- TESTE2 = VERDADEIRO

- a) NOME ← DIA = “TERÇA”
- b) SOMA ← (NUM**2/X) + (X + 1)
  - (5**2/2) + (2 + 1)
  - (25/2) + 3
  - 12.5 + 3
  - 15.5
- c) TUDO ← .NÃO. ((TESTE .OU. TESTE2) .E. (X <> NUM))
  - .NÃO. ((FALSO .OU. VERDADEIRO) .E. (2 <> 5))
  - .NÃO. (VERDADEIRO .E. VERDADEIRO)
  - .NÃO. (VERDADEIRO)
  - FALSO

## Exercício 7

 Resolva as expressões lógicas, determinando se a expressão é verdadeira ou falsa:

- a) 2>3 =
- b) (6<8) .ou. (3>7) =
- c) não (2<3) .e. (2 mod 1> 1 .ou. 0/1 >=0) =
- d) (34>9 .e. 5+u = 34) .ou. (5=15/3 .e. 8>12) = ((u = 29) .e. 8>12), {onde u = 29}

Resposta:

- a) 2>3 = FALSO
- b) (6<8) .ou. (3>7) = VERDADEIRO
- c) não (2<3) .e. (2 mod 1> 1 .ou. 0/1 >=0) = FALSO
  - não (VERDADEIRO) .e. (VERDADEIRO .ou. VERDADEIRO)
  - FALSO .e. VERDADEIRO
  - FALSO
- d) (34>9 .e. 5+u = 34) .ou. (5=15/3 .e. 8>12) = ((u = 29) .e. 8>12), {onde u = 29}
  - (VERDADEIRO .e. 5+29 = 34) .ou. (5=15/3 .e. 8>12) = (VERDADEIRO .e.  8>12)
  - (VERDADEIRO .e. VERDADEIRO) .ou. (VERDADEIRO .e. FALSO) = (VERDADEIRO .e. FALSO)
  - VERDADEIRO .ou. FALSO = FALSO
  - VERDADEIRO = FALSO
  - FALSO

## Exercício 8

Considere a seguinte expressão ((((AMOD 5) > 5) OU (B/C >= 1)) E ((NAO ((A<50) E (B < > C)) OU (C=5)))) e determine o valor para essa expressão, tendo os valores 23, 5 e 5 como valores das variáveis A, B e C, respectivamente.

Resposta: VERDADEIRO

Resolução:

A = 23
B = 5
C = 5

- ((((23 MOD 5) > 5) OU (5/5 >= 1)) E ((NAO ((23<50) E (5 < > 5)) OU (5=5))))
- (((3 > 5) OU (1 >= 1)) E ((NAO ((23<50) E (5 < > 5)) OU (5=5))))
- ((FALSO OU VERDADEIRO) E ((NAO ((23<50) E (5 < > 5)) OU (5=5))))
- (VERDADEIRO E ((NAO ((23<50) E (5 < > 5)) OU (5=5))))
- (VERDADEIRO E ((NAO ((VERDADEIRO E FALSO)) OU (5=5))))
- (VERDADEIRO E ((NAO (FALSO)) OU (5=5)))
- (VERDADEIRO E ((VERDADEIRO) OU (5=5)))
- (VERDADEIRO E (VERDADEIRO OU VERDADEIRO))
- (VERDADEIRO E (VERDADEIRO))
- (VERDADEIRO)
- VERDADEIRO

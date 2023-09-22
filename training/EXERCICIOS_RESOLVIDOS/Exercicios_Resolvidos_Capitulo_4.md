# Exercícios de operadores e expressões - Resolvidos (Edinei)

## Exercício 1

Assinale a alternativa correta:

- a) O operador > (maior que) pode ser classificado como operador relacional do tipo unário.
- b) O resultado de uma expressão aritmética será um valor lógico.
- c) O resultado de uma expressão lógica sempre será um valor lógico.
- d) Um operador relacional usado para comparar dois números inteiros 
sempre retornará um valor inteiro.
- e) O operador .OU. é classificado com operador lógico do tipo binário e 
tem prioridade sobre os demais operadores lógicos.

Resposta: `Alterantiva C , pois é correto afirmar que o resultado de uma expressão lógica será um valor lógico`

## Exercício 2

Das alternativas apresentadas abaixo indique aquela que não devolve um valor lógico. Considere os seguintes valores para as variáveis: Media = 7, Nota = 7.25, Valor ← verdadeiro e Opção ← “a”.

- a) ((Nota >= Media) E (Opção=”b”))
- b) (((Nota + 1) > Media) OU (NAO Valor))
- c) (((Média*2)-1) MOD 2)
- d) (((Media DIV 7) = 1) OU (Nota >= Media))
- e) (((Nota - Media) > 3) = Valor)

Resposta: ` Alternativa C , Porque devolve o resultado do módulo = 1 `

## Exercício 3

Qual o valor final das variáveis A e B, após a execução das instruções abaixo ?

- A ← 3
- B ← A*5
- A ← B DIV 2
- B ← A – 10

Resposta: `B termina com -3 e A valendo 7, porque a divisao por 15 retorna inteiro, 7 ` 

## Exercício 4

Se X possui o valor 15 e foram executadas as seguintes instruções:

X ← X + 3
X ← X - 6
X ← X / 2
X ← 3 * X

Qual será o valor armazenado em X?  ` 18 `

## Exercício 5

Assinalar os comandos de atribuição considerados inválidos:

var
NOME, COR, TESTE, DIA: caracter
SOMA, NUM: inteiro
Salario: real
X: logico

- a) ( ) NOME ← “5”
- b) ( ) SOMA ← NUM + 2 * X
- c) (`x`) TESTE ← SOMA
- d) ( ) NUM ← SOMA
- e) ( ) COR ← “PRETO”
- f) (`x`) X ← X + 1
- g) (`x`) NUM ← “*ABC*”
- h) ( ) DIA ← “SEGUNDA”
- i) ( ) SOMA + 2 ← NUM
- j) (`x`) X ← (NOME = COR)
- k) ( ) salário ← 5.000
- l) ( ) salário ← 150
- m) (`x`) salário ← “insuficiente” `Esta quase respondo .T. :-()`

## Exercício 6

Quais os valores armazenados em SOMA, NOME e TUDO, supondo-se que NUM, X, COR, DIA,TESTE e TESTE2 valem, respectivamente, 5, 2, “AZUL”, “TERÇA”, FALSO e VERDADEIRO?

- a) NOME ← DIA
- b) SOMA ← (NUM**2/X) + (X + 1) 
- c) TUDO ← .NÃO. ((TESTE .OU. TESTE2) .E. (X <> NUM)) 

Resposta: `SOMA = 15.5, NOME = TERÇA e TUDO = FALSE ` 

## Exercício 7

 Resolva as expressões lógicas, determinando se a expressão é verdadeira 
ou falsa:

- a) 2>3 = ` False `
- b) (6<8) .ou. (3>7) = ` True `
- c) não (2<3) .e. (2 mod 1> 1 .ou. 0/1 >=0) = ` False `
- d) (34>9 .e. 5+u = 34) .ou. (5=15/3 .e. 8>12) = ((u = 29) .e. 8>12), ` True ` {onde u = 29}

## Exercício 8

Considere a seguinte expressão ((((A MOD 5) > 5) OU (B/C >= 1)) E ((NAO ((A<50) E (B < > C)) OU (C=5))) e determine o valor para essa expressão, tendo os valores 23, 5 e 5 como valores das variáveis A, B e C, respectivamente.
` True`
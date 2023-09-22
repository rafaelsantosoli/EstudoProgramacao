
#media = 7, Nota = 7.25, Valor ← verdadeiro and Opção ← “a”.

media = 7
Nota = 7.25
Valor = True
Opção = "a"

print("media:", media)
print("Nota:", Nota)
print("Valor:", Valor)
print("Opção:", Opção)



print(Nota >= media and Opção == "b")
print((Nota + 1) > media or not Valor)
print(((media*2)-1) % 2)
print(((media // 7) == 1) or (Nota >= media))
print(((Nota - media) > 3) == Valor)

A = 3
B = A*5
A = B // 2
B = A - 10
print(A)
print(B)

X = 15
X = X + 3
X = X - 6
X = X / 2
X = 3 * X
print(X)


NUM = 5
X = 2
COR = "AZUL"
DIA = "TERÇA"
TESTE1 = False
TESTE2 = True

SOMA = (NUM**2/X) + (X+1)
NOME = DIA
TUDO = not (TESTE1 or TESTE2) and (X != NUM)

print(SOMA)
print(NOME)
print(TUDO)


u = 29
num = 5

pink1 = 2>3
pink2 = (6<8) or (3>7)
pink3 = not (2<3) and (2 % 1> 1 or 0/1 >=0)
pink4 = (34 > 9) and (5 + u == 34) or num == (15/3)  and 8>12 == ((u == 29) and 8>12)

print(pink1)
print(pink2)
print(pink3)
print(pink4)

A = 23
B = 5 
C = 5

result = (((A % 5) > 5) or (B/C >= 1)) and ((not ((A<50) and (B != C)) or (C==5)))

print(result)




# Declarando variáveis de tipos inteiro, ponto flutuante, booleano e string

a = 10
b = 2.5
c = True
d = "Olá, mundo!"

# Usando os tipos de dados primitivos em operações matemáticas

print(a + b)
# Output: 12.5

print(a * b)
# Output: 25.0

print(a // b)
# Output: 4

print(a % b)
# Output: 0

# Usando os tipos de dados primitivos em testes condicionais

if c:
  print("O valor de c é verdadeiro.")
else:
  print("O valor de c é falso.")

# Usando os tipos de dados primitivos em strings

print(d)
# Output: Olá, mundo!

print(d.upper())
# Output: Olá, MUNDO!

print(d.lower())
# Output: olá, mundo!

# Usando os tipos de dados que se utilizam de referências

e = a # Atribuindo o valor de a para e
print("Atribuindo o valor de a para e: ", e)
# Output: 10

a = 20 # Alterando o valor de a
print("Alterando o valor de a: ", a)
# Output: 20

# O valor de e não foi alterado pois a atribuição foi feita antes da alteração de a
print("Valor de e: ", e )
# Output: 10


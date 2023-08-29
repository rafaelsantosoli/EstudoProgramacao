# Declarando variáveis de tipos lista, tupla, dicionário e conjunto

a = [1, 2, 3] # lista
b = ["a", "b", "c"] # lista
c = ("a", "b", "c") # tupla
d = {"nome": "João", "idade": 30} # dicionário
e = {1, 2, 3, 4, 5} # conjunto

# Usando os tipos de dados em operações

# soma de listas
print(a + b)

# imprime o primeiro elemento da lista
print(a[0])
# Output: 1

# Imprime o valor da chave "nome" do dicionário
print(d["nome"])
# Output: João

# Imprime o valor do conjunto e sem o elemento 2 e 3
print(e - {2, 3})
# Output: {1, 4, 5}

# Testes com referências de memória

a = [1, 2, 3] # lista
f = a

print(a)
print(f)

a.append(4)
print(a)
print(f)

f.append(5)
print(a)
print(f)

a.pop()
print(a)
print(f)


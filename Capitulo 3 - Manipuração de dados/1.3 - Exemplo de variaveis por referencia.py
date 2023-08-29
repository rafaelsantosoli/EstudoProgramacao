#Exemplo de variáveis por referencia


#Estrutura de dados
#Tipos de dados primitivos em JavaScript
#String
#Number
#Boolean
#Null
#Undefined

#Tipos de dados não primitivos em JavaScript
#Object
#Array


#Exemplo de uso de primitivos

nome1 = "João";
nome2 = nome1;

nome1 = "Maria";

console.log(nome1); #Maria
console.log(nome2); #João

#Exemplo de uso de não primitivos

nome1 = {nome: "João"};
nome2 = nome1;

nome1.nome = "Maria";

console.log(nome1); #{nome: "Maria"}
console.log(nome2); #{nome: "Maria"}



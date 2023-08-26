//Estrutura de dados
//Tipos de dados primitivos em JavaScript
//String
//Number
//Boolean
//Null
//Undefined

//Tipos de dados não primitivos em JavaScript
//Object
//Array


//Exemplo de uso de primitivos
let nome = 'João';
let outroNome = nome;

nome = 'Maria';
console.log(nome, outroNome); // Maria João

//Exemplo de uso de não primitivos
let array = [1, 2, 3];
let outroArray = array;

array.push(4);
console.log(array, outroArray); // [1, 2, 3, 4] [1, 2, 3, 4]

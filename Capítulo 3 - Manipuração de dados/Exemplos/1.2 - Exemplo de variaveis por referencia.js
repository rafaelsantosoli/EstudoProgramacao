//Exemplo de uso de primitivos
let nome = 'João';
let outroNome = nome;

nome = 'Maria';
console.log(nome, outroNome); 
//Output: Maria João

//Exemplo de uso de não primitivos
let array = [1, 2, 3];
let outroArray = array;

array.push(4);
console.log(array, outroArray); 
//Output: [1, 2, 3, 4] [1, 2, 3, 4]

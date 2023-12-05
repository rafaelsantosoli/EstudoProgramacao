# Estudo de uso de Json em TLPP (TOTVS Language Plus Plus)

- [Estudo de uso de Json em TLPP (TOTVS Language Plus Plus)](#estudo-de-uso-de-json-em-tlpp-totvs-language-plus-plus)
  - [Introdução](#introdução)
  - [O que é JSON?](#o-que-é-json)
    - [Vantagens de usar JSON](#vantagens-de-usar-json)
    - [Estrutura do JSON](#estrutura-do-json)
    - [Exemplo de JSON](#exemplo-de-json)
    - [Trabalhando com arrays](#trabalhando-com-arrays)
    - [Trabalhando com Objetos](#trabalhando-com-objetos)
    - [Ferramentas para trabalhar com JSON](#ferramentas-para-trabalhar-com-json)
    - [Plugins para VSCode](#plugins-para-vscode)
  - [Trabalhando com JSON em TLPP e ADVPL](#trabalhando-com-json-em-tlpp-e-advpl)

## Introdução

O TLPP é uma linguagem de programação criada pela TOTVS para ser utilizada no desenvolvimento de customizações para o ERP Protheus. A linguagem é baseada em C++ e possui algumas particularidades que a tornam única. Uma delas é a possibilidade de utilizar o formato JSON para manipulação de dados.

## O que é JSON?

JSON (JavaScript Object Notation) é um formato de dados que utiliza a sintaxe de objetos JavaScript. Apesar do nome, JSON é um formato de dados independente de linguagem, pois usa convenções que são familiares às linguagens C, C++, C#, Java, JavaScript, Perl, Python e muitas outras. Estas propriedades fazem com que JSON seja um formato ideal de troca de dados.

### Vantagens de usar JSON

- JSON é mais leve que XML, pois não necessita de tags de fechamento.
- Simples de ler e escrever.
- Tamanho é menor que o XML.
- Facilidade de desenvolvimento de alto desempenho nas aplicação que utilizam JSON.

### Estrutura do JSON

O JSON é composto por dois tipos de estruturas: um conjunto de pares chave/valor e uma lista ordenada de valores. Um par chave/valor consiste em um chave de propriedade (string) e um valor, que pode ser uma string, número, booleano, null, objeto ou array. Uma lista é um conjunto ordenado de valores. Os valores podem ser qualquer um dos tipos de dados mencionados anteriormente.

### Exemplo de JSON

```json
{
    "nome": "João da Silva",
    "idade": 25,
    "casado": false,
    "filhos": ["Joãozinho", "Mariazinha"],
    "endereco": {
        "rua": "Rua das Flores",
        "numero": 123,
        "bairro": "Centro",
        "cidade": "São Paulo",
        "estado": "SP"
    }
}
```

É possível ver alguns diagramas das estruturas no próprio [site oficial do JSON](https://www.json.org/json-en.html).

![Estrutura json](img/Estrutura_json.png)

### Trabalhando com arrays

Arrays são listas ordenadas de valores. Em JSON, os arrays são escritos entre `colchetes` e os valores são separados por `vírgula`.

```json
{    
    "dias_da_semana": ["domingo", "segunda", "terça", "quarta", "quinta", "sexta", "sábado"]
}
```

Lembrando que os valores podem ser qualquer um dos tipos de dados mencionados anteriormente, para tipo string, o valor deve estar entre `aspas duplas`.

É muito comum identar o Codigo em JSON para facilitar a leitura, mas o JSON não é sensível a espaços em branco, tabulações ou quebras de linha.

Exemplo:

```json
{
    "dias_da_semana": [
        "domingo",
        "segunda",
        "terça",
        "quarta",
        "quinta",
        "sexta",
        "sábado"
    ]
}
```

É possível misturar tipos de dados em um array, por exemplo:

```json
{
    "tipos_de_dados": [
        "string",   // string
        123,        // number
        true,       // boolean
        null,       // null
        {           // object
            "nome": "João da Silva",
            "idade": 25,
            "casado": false,
            "filhos": ["Joãozinho", "Mariazinha"], // array
            "endereco": {                          // object
                "rua": "Rua das Flores",
                "numero": 123,
                "bairro": "Centro",
                "cidade": "São Paulo",
                "estado": "SP"
            }
        }
    ]
}
```

### Trabalhando com Objetos

Objetos são conjuntos de pares chave/valor. São representados por `chaves`; cada chave é seguida por `dois pontos` e o valor correspondente. Os pares chave/valor são separados por `vírgula`.

```json
{
    "nome": "João da Silva",
    "idade": 25,
    "casado": false,
    "filhos": ["Joãozinho", "Mariazinha"],
    "endereco": {
        "rua": "Rua das Flores",
        "numero": 123,
        "bairro": "Centro",
        "cidade": "São Paulo",
        "estado": "SP"
    },
    "telefone": {
        "ddd": 11,
        "numero": 999999999
    },
    "documentos": {
        "cpf": 12345678900,
        "rg": 123456789
    }
}

```

### Ferramentas para trabalhar com JSON

Existem diversas ferramentas para trabalhar com JSON, tanto para criar quanto para validar. Algumas delas são:

- [JSONLint – The JSON Validator](https://jsonlint.com/)
- [JSON Editor Online](https://jsoneditoronline.org/)
- [JSON Formatter & Validator](https://jsonformatter.curiousconcept.com/)
- [Json Parser Online](http://json.parser.online.fr/)
- [JSON Viewer](http://jsonviewer.stack.hu/)
- [JSON Generator](https://json-generator.com/)

### Plugins para VSCode

O VSCode possui diversos plugins para trabalhar com JSON, alguns deles são:

- [JSON Tools](https://marketplace.visualstudio.com/items?itemName=eriklynd.json-tools)
- [JSON to TS](https://marketplace.visualstudio.com/items?itemName=MariusAlchimavicius.json-to-ts)

## Trabalhando com JSON em TLPP e ADVPL

Em ADVPL e TLPP podemos trabalhar com JSON utilizando a classe `JsonObject`.

A classe JsonObject representa um objeto JSON (JavaScript Object Notation).

Após ser populado, o valor de cada par chave-valor do JsonObject poderá ser acessados diretamente utilizando sua chave entre colchetes, similar à um vetor.

A classe JsonObject possui o construtor `JsonObject:new` e os métodos:

- [`JsonObject:DelName`](https://tdn.totvs.com/display/tec/JsonObject%3ADelName) - Remove a propriedade e seu valor de um JsonObject a partir do nome fornecido;
- [`JsonObject:FromJSON`](https://tdn.totvs.com/display/tec/JsonObject%3AFromJSON) - Permite popular o JsonObject através das informações contidas em uma string no formato JSON;
- [`JsonObject:GetJsonObject`](https://tdn.totvs.com/display/tec/JsonObject%3AGetJsonObject) - Retorna um objeto do tipo JsonObject que seja o conteúdo da propriedade informada;
- [`JsonObject:GetJsonText`](https://tdn.totvs.com/display/tec/JsonObject%3AGetJsonText) - Retorna  o valor de uma determinada chave cKey, do objeto Json, em formato de string;
- [`JsonObject:GetJsonValue`](https://tdn.totvs.com/display/tec/JsonObject%3AGetJsonValue) - Recupera o valor, e o tipo de uma determinada propriedade do objeto Json;
- [`JsonObject:GetNames`](https://tdn.totvs.com/display/tec/JsonObject%3AGetNames) - Retorna um array com todas as propriedades disponíveis no primeiro nível do JsonObject;
- [`JsonObject:HasProperty`](https://tdn.totvs.com/display/tec/JsonObject%3AHasProperty) - Verifica se o objeto json possui determinada chave cKey. Retorna verdadeiro se a chave existe, e falso caso contrário;
- [`JsonObject:set`](https://tdn.totvs.com/display/tec/JsonObject%3ASet) - Coloca um Vetor ou um Objeto Json na raiz do JsonObject;
- [`JsonObject:toJSON`](https://tdn.totvs.com/display/tec/JsonObject%3AtoJSON) - Permite exportar o objeto JSON para uma string em formato JSON;
- [`JsonObject:fromJsonFile`](https://tdn.totvs.com/display/tec/fromJsonFile) - Método que possibilita a leitura de um arquivo JSON gravando seu conteúdo no objeto;
- [`JsonObject:toJsonFile`](https://tdn.totvs.com/display/tec/toJsonFile) - Método que possibilita criação de um arquivo a partir do conteúdo de um objeto JSON.

As propriedades da classe são criadas dinamicamente, ou seja, não é necessário declarar as propriedades antes de utilizá-las.

Exemplo:

```tlpp

// Cria um objeto JSON
Local oJson := JsonObject:new()

// Adiciona propriedades ao objeto JSON
//oJson[chave] := valor

oJson["nome"] := "João da Silva"
oJson["idade"] := 25
oJson["casado"] := .F.
oJson["filhos"] := ["Joãozinho", "Mariazinha"]
oJson["endereco"] := {
    "rua": "Rua das Flores",
    "numero": 123,
    "bairro": "Centro",
    "cidade": "São Paulo",
    "estado": "SP"
}

// Exibe o objeto JSON em formato de string
CONOUT(oJson:toJson())

// Exibe o valor de uma propriedade do objeto JSON
CONOUT(oJson["nome"])

// Exibe o valor de uma propriedade do objeto JSON
CONOUT(oJson["endereco"]["rua"])

// Exibe o valor de uma propriedade do objeto JSON

Local oFilhos := oJson["filhos"]
CONOUT(oFilhos[1])

```

O código acima irá exibir o seguinte resultado:

```json
{
    "nome": "João da Silva",
    "idade": 25,
    "casado": false,
    "filhos": ["Joãozinho", "Mariazinha"],
    "endereco": {
        "rua": "Rua das Flores",
        "numero": 123,
        "bairro": "Centro",
        "cidade": "São Paulo",
        "estado": "SP"
    }
}
```

```txt

João da Silva

Rua das Flores

Joãozinho

```

No Tlpp é possível criar variáveis do tipo `Json` que são variáveis do tipo `JsonObject` e podem ser utilizadas para manipular dados no formato JSON.

Exemplo:

```tlpp

// Cria uma variável do tipo Json

Local jJson as Json

// Adiciona propriedades ao objeto JSON

jJson["nome"] := "João da Silva"
jJson["idade"] := 25
jJson["casado"] := .F.
jJson["filhos"] := ["Joãozinho", "Mariazinha"]

```	

Podemos criar variáveis do tipo string e utilizar o método `FromJSON` para popular o objeto JSON.

Exemplo:

```tlpp
Local cErro := ""

// Cria uma variável do tipo string

Local cJson := '{
    "nome": "João da Silva",
    "idade": 25,
    "casado": false,
    "filhos": ["Joãozinho", "Mariazinha"],
    "endereco": {
        "rua": "Rua das Flores",
        "numero": 123,
        "bairro": "Centro",
        "cidade": "São Paulo",
        "estado": "SP"
    }
}'

// Cria uma variável do tipo Json
Local jJson as Json

// Popula o objeto JSON
jJson := JsonObject():New()
cErro := jJson:FromJSON(cJson) // 

//Se cRet for nil o objeto foi populado com sucesso, caso contrário ocorreu um erro e retorna a mensagem de erro
If !Empty(cErro)
    CONOUT(cErro)
EndIf


```

Outra forma de popular criar um objeto JSON dinamicamente é atribuir um conteúdo JSON.

Exemplo:

```tlpp

// Cria uma variável do tipo Json
Local jJson as Json
Locla jjson2 as Json

// Popula o objeto JSON
jJson := {"chave1": "valor1", "chave2": "valor2"}
jjson2["estado"] := "SP"

// Teremos um objeto JSON com as seguintes propriedades:
// jJson["chave1"] = "valor1"
// jJson["chave2"] = "valor2"
// jJson2["estado"] = "SP"

```

Para mais informações sobre a classe `JsonObject` consulte a [Classe JsonObject](https://tdn.totvs.com/display/tec/Classe+JsonObject) e [TLpp Json](https://tdn.totvs.com/display/tec/Json).
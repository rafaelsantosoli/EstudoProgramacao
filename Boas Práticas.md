# Boas Práticas de Desenvolvimento de Software

## Introdução

Este documento tem como objetivo apresentar as boas práticas de desenvolvimento de software que devem ser seguidas pelos desenvolvedores da equipe.

## 1. Código Limpo

### 1.1. Nomes Significativos

Nomes de variáveis, métodos e classes devem ser significativos e representar o que realmente são. Nomes que não representam o que são, podem causar confusão e dificultar o entendimento do código.

**Ruim:**

```javascript

public class Pessoa {
    private String n;
    public void setNome(String n) {
        this.n = n;
    }
}
```

**Bom:**

```javascript
    public class Pessoa {
        private String nome;
        public void setNome(String nome) {
            this.nome = nome;
        }
}
```

### 1.2. Evitar comentários desnecessários

Comentários são úteis para explicar o código, mas não devem ser usados para explicar o óbvio. O código deve ser autoexplicativo, e comentários devem ser usados para explicar o que não é óbvio.

**Ruim:**

```javascript
    // Verifica se o usuário está logado
    if (usuarioLogado) {
        // Faz alguma coisa
    }
```

**Bom:**

```javascript
    if (usuarioLogado) {
        // Faz alguma coisa
    }
```

### 1.3 Funções pequenas e com uma única responsabilidade

Funções devem ser pequenas e fazer apenas uma coisa. Funções grandes e com muitas responsabilidades são difíceis de entender e de testar.

**Ruim:**

```javascript

//Calculadora
function calcular(a, b, operacao) {
    if (operacao == "soma") {
        return a + b;
    } else if (operacao == "subtracao") {
        return a - b;
    } else if (operacao == "multiplicacao") {
        return a * b;
    } else if (operacao == "divisao") {
        return a / b;
    }
}
```

**Bom:**

```javascript

//Calculadora
function somar(a, b) {
    return a + b;
}

function subtrair(a, b) {
    return a - b;
}

function multiplicar(a, b) {
    return a * b;
}

function dividir(a, b) {
    return a / b;
}
```

### 1.4. Evitar condicionais negativas

Condicionais negativas são difíceis de entender e podem causar confusão.

**Ruim:**

```javascript
    if (!usuarioLogado) {
        // Faz alguma coisa
    }
```

**Bom:**

```javascript
    if (usuarioNaoLogado) {
        // Faz alguma coisa
    }
```

### 1.5. Evitar condicionais

Condicionais podem ser evitados usando polimorfismo.

**Ruim:**

```javascript
    public class Pessoa {
        private String nome;
        private String tipo;
        public void setNome(String nome) {
            this.nome = nome;
        }
        public void setTipo(String tipo) {
            this.tipo = tipo;
        }
        public String getTipo() {
            return tipo;
        }
    }
```

**Bom:**

```javascript
    public abstract class Pessoa {
        private String nome;
        public void setNome(String nome) {
            this.nome = nome;
        }
        public abstract String getTipo();
    }
    public class PessoaFisica extends Pessoa {
        public String getTipo() {
            return "Física";
        }
    }
    public class PessoaJuridica extends Pessoa {
        public String getTipo() {
            return "Jurídica";
        }
    }
```

### 1.6. Evitar efeitos colaterais

Funções devem fazer apenas uma coisa e não devem causar efeitos colaterais. Efeitos colaterais são mudanças de estado que não são esperadas.

**Ruim:**

```javascript
    public class Pessoa {
        private String nome;
        public void setNome(String nome) {
            this.nome = nome;
        }
        public String getNome() {
            return nome;
        }
    }
```

**Bom:**

```javascript
    public class Pessoa {
        private String nome;
        public void alterarNome(String nome) {
            this.nome = nome;
        }
        public String obterNome() {
            return nome;
        }
    }
```

### 1.7. Espaçamento vertical entre conceitos

Espaçamento vertical entre conceitos relacionados ajuda a entender o código.

**Ruim:**

```javascript
    //Calculadora
    function somar(a, b) {
        return a + b;
    }
    function subtrair(a, b) {
        return a - b;
    }
    function multiplicar(a, b) {
        return a * b;
    }
    function dividir(a, b) {
        return a / b;
    }
```

**Bom:**

```javascript
    //Calculadora
    function somar(a, b) {
        return a + b;
    }

    function subtrair(a, b) {
        return a - b;
    }

    function multiplicar(a, b) {
        return a * b;
    }

    function dividir(a, b) {
        return a / b;
    }
```
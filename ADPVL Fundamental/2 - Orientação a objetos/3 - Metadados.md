# Metadados

## Descrição

Metadados são dados sobre dados. Eles são informações que descrevem as características de um dado, como o seu nome, tipo, tamanho, entre outros. Os metadados são essenciais para a organização e interpretação dos dados, pois fornecem informações importantes sobre o conteúdo e a estrutura dos dados.

## Objetivos

Neste conteúdo, você aprenderá:

- O que são metadados e por que são importantes;
- Os diferentes tipos de metadados;
- Como os metadados são usados na prática.

## Contexto

Os metadados são amplamente utilizados em diversas áreas, como biblioteconomia, arquivologia, ciência da computação, entre outras. Eles desempenham um papel fundamental na organização, recuperação e interpretação dos dados, facilitando a sua utilização e compreensão.

## Estrutura dos Metadados

Os metadados podem ser classificados em diferentes categorias, de acordo com a sua finalidade e conteúdo. Alguns dos principais tipos de metadados são:

| Metadado | Funcionalidade | Exemplo | Padrões internacionais |
| --- | --- | --- | --- |
| Descritivos | Encontrar recurso/objeto/documento em uma pesquisa ou para entender o recuso/objeto/documentos | Título, autor, data de criação, palavras-chave | Dublin Core, MARC 21, RFD |
| Administrativos (técnicos) | Decodificar e renderizar arquivos | Formato, tamanho, resolução, tipo de arquivo, software utilizado, esquema de compressão | METS, PREMIS |
| Administrativos (preservação digital) | Preservar e manter a integridade dos arquivos | Direitos autorais, formato, versão, checksum, contexto de criação | OAIS, PREMIS |
| Administrativos (direitos) | Gerenciar direitos de uso e acesso | Licenças, restrições de acesso, políticas de preservação, copyright | Creative Commons, DSpace |
| Estruturais | Organizar e relacionar os dados | Sequência, ordem, hierarquia |  |
| Linguagens de marcação | Integrar metadados e características em diferentes contextos | Parágrafos, cabeçalhos, listas, nomes, referências |  |

## Aplicações dos Metadados em orientação a objetos

Na orientação a objetos, os metadados são utilizados para descrever as características e comportamentos dos objetos, como atributos, métodos, relacionamentos, entre outros. Eles são essenciais para a definição e manipulação dos objetos em um sistema orientado a objetos, permitindo a sua criação, instância e interação.

## Metadados, anotações e reflexão

Em Java, por exemplo, os metadados são representados por anotações, que são marcadores colocados no código fonte para fornecer informações adicionais sobre as classes, métodos, variáveis, entre outros elementos. As anotações são usadas para configurar o comportamento dos objetos em tempo de execução, permitindo a sua personalização e adaptação de acordo com as necessidades do sistema.

A reflexão é um recurso que permite acessar e manipular os metadados em tempo de execução, possibilitando a inspeção e modificação dos objetos em tempo de execução. Com a reflexão, é possível obter informações sobre as classes, métodos, atributos, construtores, entre outros elementos, e realizar operações dinâmicas com os objetos.

## Metaprogramação e reflexão

A metaprogramação é uma técnica avançada que envolve a criação de programas que são capazes de manipular a si mesmos, ou seja, de gerar, modificar e executar código em tempo de execução. A reflexão é um dos recursos fundamentais da metaprogramação, pois permite a manipulação dinâmica dos metadados e a execução de operações complexas em tempo de execução.

Em resumo, os metadados desempenham um papel fundamental na organização, interpretação e manipulação dos dados em um sistema, facilitando a sua utilização e compreensão. Eles são essenciais para a definição e manipulação dos objetos em um sistema orientado a objetos, permitindo a sua personalização e adaptação de acordo com as necessidades do sistema.

Exemplo de metadados em Java:

```java

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MyAnnotation {
    String value();
}

public class MyClass {

    @MyAnnotation("Hello, World!")
    public void myMethod() {
        System.out.println("Hello, World!");
    }

}

```

Neste exemplo, a anotação `@MyAnnotation` é usada para adicionar metadados ao método `myMethod`, fornecendo informações adicionais sobre o seu comportamento em tempo de execução.

Ao usar a reflexão, é possível acessar e manipular os metadados associados ao método `myMethod`, permitindo a personalização e adaptação do seu comportamento de acordo com as necessidades do sistema.

Exemplo de reflexão em Java:

```java

import java.lang.reflect.Method;

public class Main {

    public static void main(String[] args) {
        MyClass myClass = new MyClass();
        Method method = myClass.getClass().getMethod
        ("myMethod");
        MyAnnotation annotation = method.getAnnotation
        (MyAnnotation.class);
        System.out.println(annotation.value());
    }

}
    
```

Neste exemplo, a reflexão é usada para acessar e exibir os metadados associados ao método `myMethod`, permitindo a personalização e adaptação do seu comportamento em tempo de execução.

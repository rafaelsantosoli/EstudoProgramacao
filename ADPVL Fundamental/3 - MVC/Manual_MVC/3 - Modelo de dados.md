# Modelo de dados

## Sumário

- [Modelo de dados](#modelo-de-dados)
  - [Sumário](#sumário)
  - [Introdução](#introdução)
  - [Objetivos](#objetivos)
  - [Tipos de Modelos de Dados](#tipos-de-modelos-de-dados)
  - [CRUD - Create, Read, Update, Delete](#crud---create-read-update-delete)
    - [Exemplo Prático com SQL](#exemplo-prático-com-sql)
    - [Importância do CRUD](#importância-do-crud)
  - [Referências](#referências)

## Introdução

Um modelo de dados é uma representação abstrata e organizada das informações de um domínio específico, projetada para facilitar a compreensão, gerenciamento e manipulação dos dados. Em termos simples, ele descreve como os dados são estruturados, quais são os seus atributos e como eles se relacionam entre si.

## Objetivos

Os principais objetivos de um modelo de dados são:

1. **Estruturar os Dados**: Organizar os dados de forma lógica e coerente, facilitando a sua compreensão e manipulação.
2. **Garantir a Integridade**: Definir regras e restrições para garantir a integridade e consistência dos dados.
3. **Facilitar o Desenvolvimento**: Fornecer uma base sólida para o desenvolvimento de sistemas de informação, permitindo a criação de bancos de dados eficientes e eficazes.
4. **Promover a Interoperabilidade**: Facilitar a integração e a interoperabilidade entre diferentes sistemas e aplicações.
5. **Documentar os Dados**: Fornecer uma documentação clara e precisa da estrutura dos dados, facilitando a manutenção e evolução dos sistemas.
6. **Melhorar a Comunicação**: Facilitar a comunicação entre os stakeholders, desenvolvedores e analistas de sistemas.
7. **Otimizar o Desempenho**: Projetar uma estrutura de dados eficiente e otimizada para melhorar o desempenho do sistema.
8. **Reduzir a Redundância**: Minimizar a redundância e a duplicação de dados, promovendo a normalização e a consistência dos dados.
9. **Facilitar a Análise e o Relacionamento**: Permitir a análise e o relacionamento dos dados de forma eficaz, facilitando a extração de informações úteis.
10. **Promover a Segurança**: Definir mecanismos de segurança para proteger os dados contra acessos não autorizados e garantir a privacidade e a confidencialidade das informações.
11. **Facilitar a Migração e a Integração**: Facilitar a migração e a integração dos dados entre diferentes sistemas e plataformas.
12. **Promover a Escalabilidade**: Projetar uma estrutura de dados escalável e flexível para suportar o crescimento e a evolução do sistema.

## Tipos de Modelos de Dados

Existem três principais tipos de modelos de dados:

1. **Modelo Conceitual**:
   - Foco na definição de conceitos e regras de negócios.
   - Utiliza diagramas de entidade-relacionamento (ER) para ilustrar entidades (objetos ou coisas) e os relacionamentos entre elas.
   - Não inclui detalhes técnicos, sendo mais voltado para o entendimento dos requisitos do negócio.

2. **Modelo Lógico**:
   - Detalha a estrutura dos dados sem se preocupar com a implementação física.
   - Define entidades, atributos, tipos de dados, relacionamentos, chaves primárias e estrangeiras.
   - Utiliza diagramas de entidade-relacionamento aprimorados e/ou diagramas de classes UML.

3. **Modelo Físico**:
   - Especifica como os dados serão armazenados fisicamente no sistema de banco de dados.
   - Inclui detalhes técnicos como tipos de dados específicos, índices, partições, tabelas, colunas, etc.
   - Reflete as considerações de desempenho e requisitos específicos do sistema de gerenciamento de banco de dados (SGBD).

## CRUD - Create, Read, Update, Delete

CRUD é um acrônimo que representa as quatro operações básicas que podem ser realizadas em um banco de dados ou sistema de armazenamento de dados. Essas operações são essenciais para a manipulação e gestão dos dados. CRUD significa:

1. **Create (Criar)**: Refere-se à operação de adicionar novos dados ou registros ao sistema. Por exemplo, ao registrar um novo usuário em um sistema, você está realizando a operação de "Create".

2. **Read (Ler)**: Refere-se à operação de consultar ou recuperar dados existentes no sistema. Por exemplo, ao buscar informações sobre um usuário específico, você está realizando a operação de "Read".

3. **Update (Atualizar)**: Refere-se à operação de modificar ou atualizar dados existentes no sistema. Por exemplo, ao alterar o endereço de um usuário, você está realizando a operação de "Update".

4. **Delete (Excluir)**: Refere-se à operação de remover dados ou registros do sistema. Por exemplo, ao deletar a conta de um usuário, você está realizando a operação de "Delete".

Essas operações são fundamentais em praticamente qualquer aplicação que interaja com um banco de dados. Em uma aplicação web, por exemplo, uma interface de administração de usuários pode permitir que o administrador crie novos usuários, visualize informações sobre os usuários existentes, atualize detalhes de um usuário e exclua usuários, implementando assim todas as operações CRUD.

### Exemplo Prático com SQL

- **Create**: `INSERT INTO usuarios (nome, email) VALUES ('João', 'joao@example.com');`
- **Read**: `SELECT * FROM usuarios WHERE id = 1;`
- **Update**: `UPDATE usuarios SET email = 'joao.novo@example.com' WHERE id = 1;`
- **Delete**: `DELETE FROM usuarios WHERE id = 1;`

### Importância do CRUD

1. **Fundamental para o Desenvolvimento de Software**: As operações CRUD são a base para qualquer sistema de gerenciamento de dados.
2. **Facilita a Interação com Banco de Dados**: Fornece uma maneira padronizada e estruturada de interagir com o banco de dados.
3. **Apoia a Manutenção e Evolução de Sistemas**: Permite que os dados sejam facilmente gerenciados, o que é essencial para a manutenção e evolução dos sistemas de software.

Em resumo, CRUD é um conjunto de operações essenciais que formam a base da maioria dos sistemas de software que interagem com bancos de dados.

## Referências

- [Padrões de Projeto : O modelo MVC - Model View  Controller](https://www.macoratti.net/vbn_mvc.htm#:~:text=O%20padr%C3%A3o%20MVC,de%20apresenta%C3%A7%C3%A3o%20e%20de%20neg%C3%B3cio.)

- [Padrão MVC - Java Magazine](https://www.devmedia.com.br/padrao-mvc-java-magazine/21995#3)
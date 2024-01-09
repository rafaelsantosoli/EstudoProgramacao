# Linguagem ADVPL

A linguagem ADVPL (Advanced Protheus Language) é uma linguagem de programação de alto nível, sendo uma evolução da linguagem xBase (Clipper, Visual Objects e depois FiveWin). Ela foi criada pela empresa brasileira Microsiga Software S/A, atualmente TOTVS S/A, para ser utilizada no ERP Microsiga Protheus.

O ADVPL é uma extensão da linguagem xBase, com suporte a funções, comandos, operadores e estruturas de controle fluxo e palavras reservadas adicionais disponibilizadas pela TOTVS. Também é uma linguagem orientada a objetos e eventos, permitindo ao programador desenvolver aplicações visuais e criar suas próprias classes de objetos.

A linguagem ADVPL é interpretada, ou seja, não é necessário compilar o código fonte para executá-lo. O código fonte é interpretado em tempo de execução, sendo convertido em código de máquina.

Quando compilados, todos os arquivos de código tornam-se unidades de inteligência básicas, chamados APO´s (de 
Advanced Protheus Objects). Os APO´s são armazenados em um repositório de objetos, chamado de RPO (de Repository Protheus Objects). O RPO é um arquivo binário, que contém todos os APO´s compilados, e é carregado na memória do servidor de aplicação Protheus (TDS.exe) quando o servidor é iniciado.

O compilador e o interpretador da linguagem ADVPL é o próprio servidor PROTHEUS (PROTHEUS Server), e existe 
um Ambiente visual para desenvolvimento integrado (PROTHEUSIDE), em que o código pode ser criado, compilado e 
depurado.

Os programas em ADVPL podem conter comandos ou funções de interface com o usuário. De acordo com tal 
característica, tais programas são subdivididos nas seguintes categorias:

- Programação Com Interface Própria com o Usuário
- Programação Sem Interface Própria com o Usuário

## Programação Com Interface Própria com o Usuário

Nesta categoria, entram os programas desenvolvidos para serem executados através do terminal remoto do Protheus, o Protheus Remote.

O Protheus Remote é a aplicação encarregada da interface e da interação com o usuário, sendo que todo o processamento do código em ADVPL, o acesso ao banco de dados e o gerenciamento de conexões é efetuado no Protheus Server.

O Protheus Remote é o principal meio de acesso a execução de rotinas escritas em ADVPL no Protheus Server, e por isso permite executar qualquer tipo de código, tenha ele interface com o usuário ou não.

Porém, nesta categoria são considerados apenas os programas que realizem algum tipo de interface remota, utilizando o protocolo de comunicação do Protheus.Podem-se criar rotinas para a customização do sistema ERP Microsiga Protheus, desde processos adicionais até mesmo relatórios. A grande vantagem é aproveitar todo o Ambiente montado pelos módulos do ERP Microsiga Protheus. Porém, com o ADVPL é possível até mesmo criar toda uma aplicação, ou módulo, do começo.


## Programação Sem Interface Própria com o Usuário

Nesta categoria, entram os programas desenvolvidos para serem executados através do servidor de aplicação Protheus. Estas rotinas são apenas processos, ou Jobs, executados no Protheus Server.

Existe a possibilidade criar a interface em rotinas externas, desenvolvidas em outras linguagens, que são 
responsáveis por iniciar os processos no servidor Protheus, por meio dos meios disponíveis de integração e 
conectividade no Protheus.

Por exemplo uso de rotinas com front-end Angular, React, Vue, etc. e back-end em ADVPL e TLPP.

De acordo com a utilização e com o meio de conectividade utilizado, estas rotinas são subcategorizadas assim:

- Programação por Processos: Rotinas escritas em ADVPL podem ser iniciadas como processos individuais 
(sem interface), no Protheus Server através de duas maneiras: Iniciadas por outra rotina ADVPL por meio da 
chamada de funções como StartJob() ou CallProc() ou iniciadas automaticamente, na inicialização do Protheus 
Server (quando propriamente configurado).

- Programação de RPC: Através de uma biblioteca de funções disponível no Protheus (uma API de 
comunicação), podem-se executar rotinas escritas em ADVPL diretamente no Protheus Server, por aplicações 
externas escritas em outras linguagens. Isto é o que se chama de RPC (de Remote Procedure Call, ou 
Chamada de Procedimentos Remota). O servidor Protheus também pode executar rotinas em ADVPL, em 
outros servidores Protheus, através de conexão TCP/IP direta, utilizando o conceito de RPC. Do mesmo modo, 
aplicações externas podem requisitar a execução de rotinas escritas em ADVPL, pela conexão TCP/IP direta.

- Programação Web: O Protheus Server pode também ser executado como um servidor Web, respondendo a 
requisições HTTP. No momento destas requisições, pode executar rotinas escritas em ADVPL como 
processos individuais, enviando o resultado das funções como retorno das requisições para o cliente HTTP 
(como por exemplo, um Browser de Internet). Qualquer rotina escrita em ADVPL, que não contenha comandos 
de interface, pode ser executada através de requisições HTTP. O Protheus permite a compilação de arquivos 
HTML, contendo código ADVPL embutido. São os chamados arquivos ADVPL ASP, para a criação de páginas 
dinâmicas.

- Programação TelNet: TelNet é parte da gama de protocolos TCP/IP que permite a conexão a um computador 
remoto, através de uma aplicação cliente deste protocolo. O PROTHEUS Server pode emular um terminal pela 
execução de rotinas escritas em ADVPL. Ou seja, pode-se escrever rotinas ADVPL cuja interface final será um 
terminal TelNet ou um coletor de dados móvel.
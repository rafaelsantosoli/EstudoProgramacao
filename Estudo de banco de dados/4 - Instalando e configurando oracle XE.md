# Instalando e configurando oracle XE no Windows

## Instalando o Oracle XE

1. Acesse o site da Oracle e faça o download do Oracle XE: [https://www.oracle.com/br/database/technologies/xe-downloads.html](https://www.oracle.com/br/database/technologies/xe-downloads.html)
2. Execute o instalador do Oracle XE
3. Clique em "Next"
4. Aceite os termos de licença e clique em "Next"
5. Clique em "Next" até finalizar a instalação

### Criando variáveis de ambiente

1. Abra o "Painel de Controle"
2. Clique em "Sistema"
3. Clique em "Configurações avançadas do sistema"
4. Clique em "Variáveis de ambiente"
5. Clique em "Novo" na seção "Variáveis do sistema"
6. Preencha os campos:
   - Nome da variável: ORACLE_HOME
   - Valor da variável: C:\oraclexe\app\oracle\product\11.2.0\server - Substitua "C:\oraclexe" pelo caminho de instalação do Oracle XE
   - Clique em "OK"
7. Clique em "Novo" na seção "Variáveis do sistema"
8. Preencha os campos:
   - Nome da variável: TNS_ADMIN
   - Valor da variável: C:\oraclexe\app\oracle\product\11.2.0\server\network\admin - Substitua "C:\oraclexe" pelo caminho de instalação do Oracle XE
   - Clique em "OK"
9. Clique em "Path" na seção "Variáveis do sistema"
10. Clique em "Editar"
11. Clique em "Novo"
12. Preencha o campo:
    - Valor da variável: %ORACLE_HOME%\bin
    - Clique em "OK"
13. Clique em "OK"

## Configurando o Oracle XE

1. Abra o SQL Plus
2. Digite o comando `connect sys as sysdba`
3. Digite a senha que você definiu durante a instalação
4. Digite o comando `alter session set "_ORACLE_SCRIPT"=true;` - Este comando é necessário para criar um usuário comum - Não é recomendado para ambientes de produção, este comando é apenas para fins de estudo. Ele permite a criação de usuários comuns no Oracle XE
5. Digite o comando `create user usuario identified by senha;` - Substitua "usuario" pelo nome do usuário e "senha" pela senha do usuário - Este comando cria um usuário
6. Digite o comando `grant all privileges to usuario;` - Substitua "usuario" pelo nome do usuário
7. Digite o comando `exit`

### Alterando o collation do Oracle XE

1. Abra o SQL Plus
2. Digite o comando `SELECT VALUE$ FROM SYS.PROPS$ WHERE NAME = 'NLS_CHARACTERSET'`; - Este comando exibe o collation atual
3. Digite o comando `SHUTDOWN IMMEDIATE;` - Este comando desliga o Oracle XE
4. Digite o comando `STARTUP RESTRICT;` - Este comando inicia o Oracle XE em modo de manutenção
5. Digite o comando `ALTER DATABASE CHARACTER SET INTERNAL_USE WE8MSWIN1252;` - Este comando altera o collation para WE8MSWIN1252
6. Digite o comando `SHUTDOWN IMMEDIATE;` - Este comando desliga o Oracle XE
7. Digite o comando `STARTUP;` - Este comando inicia o Oracle XE

## Instalando o SQL Developer

1. Acesse o site da Oracle e faça o download do SQL Developer: [https://www.oracle.com/br/tools/downloads/sqldev-downloads.html](https://www.oracle.com/br/tools/downloads/sqldev-downloads.html)
2. Execute o instalador do SQL Developer



### Conectando ao Oracle XE

1. Abra o SQL Developer
2. Clique em "New Connection"
3. Preencha os campos:
   - Connection Name: Nome da conexão
   - Username: Nome do usuário
   - Password: Senha do usuário
   - Hostname: localhost
   - Port: 1521
   - SID: XE
   - Clique em "Test"
   - Clique em "Save"
   - Clique em "Connect"



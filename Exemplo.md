# Instalação do Git

Git é um sistema de controle de versão distribuído, usado principalmente no desenvolvimento de software, mas pode ser usado para registrar o histórico de edições de qualquer tipo de arquivo.

## Git vs GitHub

Git é um sistema de controle de versão distribuído, enquanto GitHub é uma plataforma de hospedagem de código que permite que os desenvolvedores trabalhem em projetos juntos.

## Git Bash

Git Bash é um emulador de terminal para Git. O Git Bash permite que os usuários do Windows usem comandos Git e Shell nativos do Linux.

### Instalação

1. Acesse o site do [Git](https://git-scm.com/downloads) e clique em "Download 2.32.0 for Windows Setup".
2. Execute o arquivo baixado e siga as instruções de instalação.
3. Após a instalação, abra o Git Bash e execute o comando `git --version` para verificar se a instalação foi bem sucedida.
4. Execute o comando `git config --global user.name "Seu Nome"` para configurar o nome do usuário.
5. Execute o comando `git config --global user.email "

### Logar no GitHub

1. Acesse o site do [GitHub](
2. Clique em "Sign in" e faça login na sua conta.
3. Clique na sua foto de perfil e depois em "Settings".
4. Clique em "Developer settings" e depois em "Personal access tokens".
5. Clique em "Generate new token".
6. Digite um nome para o token e selecione as opções "repo" e "admin:public_key".
7. Clique em "Generate token".
8. Copie o token gerado.
9. Abra o Git Bash e execute o comando `git config --global user.password "Seu Token"` para configurar o token.
10. Execute o comando `git config --global credential.helper store` para salvar o token.
11. Execute o comando `git config --global credential.helper cache` para salvar o token na memória.

### Definir usuário e email local

1. Abra o Git Bash e execute o comando `git config --global user.name "Seu Nome"` para configurar o nome do usuário.
2. Execute o comando `git config --global user.email "Seu Email"` para configurar o email do usuário.
3. Execute o comando `git config --global --list` para verificar as configurações do Git.
4. Execute o comando `git config --global --unset user.name` para remover a configuração do nome do usuário.
5. Execute o comando `git config --global --unset user.email` para remover a configuração do email do usuário.


### Clone do repositório

1. Acesse o repositório no GitHub.
2. Clique no botão "Code" e copie o link.
3. Abra o Git Bash e execute o comando `git clone <link>` para clonar o repositório.
4. Execute o comando `cd <nome do repositório>` para acessar o repositório.
5. Execute o comando `git remote -v` para verificar o repositório remoto.
6. Execute o comando `git branch -a` para verificar as branches do repositório.
7. Execute o comando `git checkout <nome da branch>` para acessar a branch desejada.

### Criação de branch

1. Execute o comando `git checkout -b <nome da branch>` para criar uma branch e acessá-la.
2. Execute o comando `git branch` para verificar as branches do repositório.
3. Execute o comando `git push --set-upstream origin <nome da branch>` para enviar a branch para o repositório remoto.
4. Execute o comando `git branch -a` para verificar as branches do repositório.
5. Execute o comando `git checkout <nome da branch>` para acessar a branch desejada.
6. Execute o comando `git branch` para verificar as branches do repositório.
7. Execute o comando `git pull` para atualizar o repositório local com as alterações do repositório remoto.

### Remover branch

1. Execute o comando `git branch -d <nome da branch>` para remover a branch local.
2. Execute o comando `git push origin --delete <nome da branch>` para remover a branch remota.
3. Execute o comando `git branch -a` para verificar as branches do repositório.
4. Execute o comando `git checkout <nome da branch>` para acessar a branch desejada.

### Remover repositório

1. Execute o comando `git remote -v` para verificar o repositório remoto.
2. Execute o comando `git remote remove origin` para remover o repositório remoto.
3. Execute o comando `git remote -v` para verificar o repositório remoto.
4. Execute o comando `git branch -a` para verificar as branches do repositório.

### Atualização do repositório

1. Execute o comando `git pull` para atualizar o repositório local com as alterações do repositório remoto.
2. Execute o comando `git branch` para verificar as branches do repositório.
3. Execute o comando `git checkout <nome da branch>` para acessar a branch desejada.

### Subir alterações

1. Execute o comando `git add .` para adicionar as alterações ao repositório.
2. Execute o comando `git commit -m "Mensagem"` para criar um commit com as alterações adicionadas. 
3. Execute o comando `git push` para enviar o commit para o repositório remoto.

### Comandos básicos

- `git init`: Inicializa um repositório Git.
- `git status`: Verifica o status do repositório.
- `git add`: Adiciona arquivos ao repositório.
- `git commit`: Cria um commit com os arquivos adicionados.
- `git log`: Exibe o histórico de commits.
- `git push`: Envia os commits para o repositório remoto.
- `git pull`: Atualiza o repositório local com os commits do repositório remoto.
- `git clone`: Clona um repositório remoto para o repositório local.
- `git branch`: Lista as branches do repositório.
- `git checkout`: Alterna entre as branches do repositório.
- `git merge`: Une duas branches do repositório.
- `git reset`: Desfaz commits.
- `git revert`: Desfaz commits sem perder o histórico.
- `git stash`: Guarda alterações temporariamente.
- `git tag`: Adiciona tags aos commits.
- `git rm`: Remove arquivos do repositório.
- `git mv`: Move ou renomeia arquivos do repositório.
- `git config`: Configura o Git.
- `git help`: Exibe a documentação do Git.
- `git fetch`: Busca commits do repositório remoto.
- `git remote`: Lista os repositórios remotos.
- `git diff`: Exibe as diferenças entre commits, branches e arquivos.
- `git blame`: Exibe as alterações feitas em um arquivo.
- `git grep`: Exibe as linhas de um arquivo que contém um determinado termo.
- `git archive`: Cria um arquivo zip ou tar com os arquivos do repositório.


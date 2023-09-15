# EstudoProgramacao
Repositório para estudo de lógica de programação

#Primeiros passos no GIT;
Edinei: Comandos basicos Git:
 apos instalar o git -
git config --global [user.name](http://user.name/) "Gustavo Batista"
git config --global user.mail "[cruzney@gmail.com](mailto:cruzney@gmail.com)"
 git config --list

---

cd /diretorios

 * git init

---

untracked

unmodified

modified

staged

- git status
- git diff “usar sempre antes de comitar”
- git diff —name-only
- git log --graph
- git log
- git log —decorate
- git shortlog  / -sn
- git show +Ref“7bc396383fa2ba9e33e42f3025f22fdad5b02163”
- git commit -m “Meu Primeiro Commit”
- git branch -m main
- git commit -am “mensagem do commit”   (Para comitar todos os arquivos modificados
- `git remote add origin <link_para_o_seu_repositorio>`

# **Desfazendo o último commit**

Para desfazer o último *commit* feito você deve usar o comando a seguir:

`git reset HEAD~1`

Ou o comando a seguir, que é um atalho para o comando acima:

`git reset HEAD^`

Ou até mesmo o atalho a seguir:

`git reset HEAD~`

git reset —soft —mixed —hard  + **Ref**

- checkout -b ‘teste’   (criar Branchs) -d ‘apaar
- git merge out
- git stash - list - clear - aplay
- git tag -m -d ‘apagar’
- git revert .. commit id

### Branch’s

- git checkout -b ‘test’
- git checkout master / test
- git branch   (Lista)
- git branch -D test
- git stash
- git config —global alias.s status

**esc : wq**

* git status
* git push --set-upstream origin Edinei
* Adição do arquivo Git .gitignore
  
   - Criar arquivo .gitignore;
  -  Colocar o nome dos arquivos ou pastas que vamos ignorar;
    - Cada um em uma linha;
    - git rm --cached `nomedoarquivo` // Para remover arquivo do tracker


## Estudo na Pratica do Capitulo 4
* Imersão geral em todo material
* Resolução dos exercícios propostos 
* Subida para a Branch especifica no GitHub
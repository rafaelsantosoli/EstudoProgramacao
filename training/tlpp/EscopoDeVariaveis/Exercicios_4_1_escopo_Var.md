
## Exercício 1 - Escopo de variáveis Locais

Considerando o seguinte código:

```
User Function Call()

    Local cVar1 := "Brasil"
    
    u_filha2()

    CONOUT(cVar1)

Return

User Function filha2()

    Local cVar1 := "São Paulo"
    alert(cVar1)

Return

```

O resultado da execução do código acima, será, Brasil. alterantiva (a) . Porque as variaveis cVar1 estão definidas como Local em ambas User Functions.

    a) Brasil
    b) São Paulo
    c) Erro de compilação
    d) Erro de execução

## Exercício 2 - Escopo de variáveis Static 

Considerando o seguinte código:

```advpl

STATIC cVar1 := "Brasil"

User Function Main()

    Static cVar1 := "Bahia"
    
    filha()

    CONOUT(cVar1)

Return

User Function filha()

    Static cVar1 := "São Paulo"

Return

```

O resultado da execução do código acima, será, São Paulo. alterantiva (c) . Porque as variaveis cVar1 estão definidas como Static em ambas User Functions

    a) Brasil
    b) Bahia
    c) São Paulo
    d) Erro de compilação
    e) Erro de execução

## Exercício 3 - Escopo de variáveis Static

Considere o seguinte código:

```advpl

STATIC cVar1 := "Brasil"

User Function Main()

    Local cVar1 := "Bahia"
    
    filha()

    CONOUT(cVar1)

Return

User Function filha()

    Local cVar1 := "São Paulo"

Return

```

O resultado da execução do código acima, será, São Paulo. alterantiva (c) . Porque as variaveis cVar1 estão definidas como Static em ambas User Functions, mesmo considerando cVar1 recebendo "Brasil" fora da Function.

    a) Brasil
    b) Bahia
    c) São Paulo
    d) Erro de compilação
    e) Erro de execução

## Exercício 4 - Escopo de variáveis Static

Considere o seguinte código:

```advpl

STATIC cVar1 := "Brasil"

User Function Main()   
    
    filha()

    CONOUT(cVar1)

Return

User Function filha()

    cVar1 := "São Paulo"

Return

```

Continua exibindo "São Paulo", porque a variável cVar1 está sem definição, portanto é considerda como Private.

    a) Brasil
    b) São Paulo
    c) Erro de compilação
    d) Erro de execução

## Exercício 5 - Escopo de variáveis Private

Considere o seguinte código:

```advpl

User Function Main()

    Private cVar1 := "Brasil"
    
    filha()

    CONOUT(cVar1)

Return

User Function filha()

    Private cVar1 := "São Paulo"

Return

```
O resultado da execução do código acima será "Brasil", porque as variaveis cVar1 estão definidas como Private em ambas User Functions.

    a) Brasil
    b) São Paulo
    c) Erro de compilação
    d) Erro de execução

## Exercício 6 - Escopo de variáveis Private

Considere o seguinte código:

```advpl

User Function Main()

    Private cVar1 := "Brasil"
    
    filha()

    CONOUT(cVar1)

Return

User Function filha()

    cVar1 := "São Paulo"

Return

```

O resultado da execução do código acima será "São Paulo", porque as variaveis cVar1 estão definidas como Private, na User Function "filha", não está definida, mas é considerada Private.

    a) Brasil
    b) São Paulo
    c) Erro de compilação
    d) Erro de execução

## Exercício 7 - Escopo de variáveis Private

Considere o seguinte código:

```advpl

User Function Main()

    cVar1 := "Brasil"
    
    filha()

    CONOUT(cVar1)

Return

User Function filha()

     cVar1 := "São Paulo"

Return

```

O resultado da execução do código acima será "São Paulo", porque as variaveis cVar1 não estão definidas mas são consideradas Private.

    a) Brasil
    b) São Paulo
    c) Erro de compilação
    d) Erro de execução

## Exercício 8 - Escopo de variáveis Public

Considere o seguinte código:

```advpl

User Function Main()

    Public cVar1 := "Brasil"
    
    filha()

    CONOUT(cVar1)

Return

User Function filha()

    Private cVar1 := "São Paulo"

Return

```

O resultado da execução do código acima será "Brasil", porque a variavel cVar1 estão definida como Public na User Function "Main".

    a) Brasil
    b) São Paulo
    c) Erro de compilação
    d) Erro de execução

## Exercício 9 - Escopo de variáveis Global

Crie um programa que declare uma variável global e acesse-a em uma função.

```
// Crie um programa que declare uma variável global e acesse-a em uma função.
User Function CallGlobal()
Local nValor
Local aGlbPut:={}
  // Alimenta valores das variáveis globais
  aGlbPut := {}
  aadd(aGlbPut,{"VarGlb01","Valor 01"})
  aadd(aGlbPut,{"VarGlb02","Valor 02"})
  aadd(aGlbPut,{"VarGlb03","Valor 03"})
  nValor := 123

  PutGlbVars("GlbNames",aGlbPut,nValor)
  // Retorna os valores das variáveis globais
  nValRet := 0
  aGlbRet := {}

  BuscaGlobal(aGlbRet,nValRet)

Return  

/*/{Protheus.doc} BuscaGlobal
    (long_description)
    @type  Static Function
    @Edinei Cruz
    @since 27/02/2024
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function BuscaGlobal(aGlbRet,nValRet)
Local nI
    GetGlbVars("GlbNames",aGlbRet,nValRet)
    // Exibe os valores das variáveis globais
  For nI := 1 To Len(aGlbRet)
     Conout(aGlbRet[nI][1]+" = "+aGlbRet[nI][2])
  Next nI
Return 


```
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWLIBVERSION.CH"
#Include�"rwmake.ch"�
#Include�"topconn.ch"�
#include�"fileio.ch"�
#INCLUDE�"TBICONN.CH"


/* Exemplo com FWExecStatement

    Manual da fun��o FWExecStatement
    https://tdn.totvs.com/display/public/framework/FWExecStatement
    https://tdn.totvs.com/display/public/framework/Chr

    Classe derivada da FWPreparedStatement e que encapsula a classe FwExecCachedQuery.

    Ela possui todos os m�todos da FWPreparedStatement (FWPreparedStatement) e utiliza os conceitos do cache de queries(FWExecCachedQuery)

    � utilizada para fazer cache ou n�o das queries executadas e realiza o bind de queries diretamente no banco de dados, o que torna o plano de execu��o das queries melhor aproveitado, gerando ganho de performance.
*/
USER FUNCTION pwExecSQL()

local cEstado := 'SP'
local cCodigo := '000001'
local cLoja   := '01'
local cTipo   := 'F'

Local cSelect := ""
Local cFrom   := ""
Local cWhere  := ""
Local cQuery  := ""
Local aParam  := {}
Local nI      := 0
Local cCursor := ""
Local oQryTmp := Nil

Local cPulalinha := Chr(13) + Chr(10)


/*A fun��o Chr() retorna o caractere correspondente ao c�digo ASCII passado como par�metro.

A soma de 13 + 10 � o c�digo ASCII do caractere de quebra de linha, que � representado por \r\n.

/r � o retorno de carro indicando que o cursor deve voltar para o in�cio da linha.
/n � a quebra de linha indicando que o cursor deve ir para a pr�xima linha.

    c�digo ASCII 13 = CR (Carriage Return) = \r    
    c�digo ASCII 10 = LF (Line Feed) = \n
*/


//Preparando ambiente
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FIS" TABLES "SF1","SD1","SA1","SA2","SB1","SB2","SF4"


// Montando a query

    cSelect := " SELECT "       + cPulalinha
    cSelect += " A1_COD"       + cPulalinha
    cSelect += " ,A1_LOJA"      + cPulalinha
    cSelect += " ,A1_PESSOA"    + cPulalinha
    cSelect += " ,A1_NOME"      + cPulalinha
    cSelect += " ,A1_NREDUZ"    + cPulalinha
    cSelect += " ,A1_END"       + cPulalinha
    cSelect += " ,A1_TIPO"      + cPulalinha
    cSelect += " ,A1_EST"       + cPulalinha
    cSelect += " ,A1_MUN"       + cPulalinha
    cSelect += " ,A1_BAIRRO"    + cPulalinha
    cSelect += " ,A1_CGC "      + cPulalinha

    cFrom   := " FROM "+ RetSqlName("SA1") + " SA1 " + cPulalinha

    cWhere  := " WHERE A1_COD = ? " + cPulalinha
    Aadd(aParam,{'C', cCodigo})

    cWhere  += " AND A1_LOJA = ? "    + cPulalinha
    Aadd(aParam,{'C', cLoja})

    cWhere  += " AND A1_TIPO = ? "    + cPulalinha
    Aadd(aParam,{'C', cTipo})

    cWhere  += " AND A1_EST = ? "   + cPulalinha
    Aadd(aParam,{'C', cEstado})

    //Impress�o da query
    CONOUT("QUERY SEM PARAMETROS: ", cSelect, cFrom, cWhere, cPulalinha)

    cQuery := ChangeQuery(cSelect+cFrom+cWhere)
    oQryTmp := FwExecStatement():New(cQuery)

    For nI := 1 to Len(aParam)
        If aParam[nI][1] == 'U'
            oQryTmp:SetUnsafe(nI, aParam[nI][2])
        Elseif aParam[nI][1] == 'C'
            oQryTmp:setString(nI, aParam[nI][2])
        Elseif aParam[nI][1] == 'D'
            oQryTmp:setDate(nI, aParam[nI][2])
        Endif
    Next

    // Limpando mem�ria do array de par�metros
    ASize(aParam, 0)

    // Imprime query com os par�metros
    CONOUT("QUERY PRONTA: ", oQryTmp:GetFixQuery(), cPulalinha )

    // Executando a query
    cCursor := oQryTmp:OpenAlias(GetNextAlias())

    // Imprimindo o registro
    while !(cCursor)->(Eof())
        CONOUT( "A1_COD: " + (cCursor)->A1_COD, "A1_LOJA: " + (cCursor)->A1_LOJA, cPulalinha )        

        // Avan�a para o pr�ximo registro
        (cCursor)->(DbSkip())
    END
    

    // Fechando o cursor
    (cCursor)->(DbCloseArea())

    // Destroi o objeto
    FreeObj(oQryTmp)

// Encerra o ambiente
RESET ENVIRONMENT

RETURN

/*
Exemplo com TcGenQry2

Permite a abertura de uma query diretamente no banco de dados utilizado na conex�o atual, mediante uso da RDD TOPCONN, informando atrav�s de um array de par�metros os conte�dos dos campos para fazer BIND de valores na Query informada.

https://tdn.totvs.com/display/tec/TCGenQry2
https://tdn.totvs.com/display/tec/DBUseArea
*/

USER FUNCTION pwGenSQL()

local cEstado := 'SP'
local cCodigo := '000001'
local cLoja   := '01'
local cTipo   := 'F'

Local cSelect := ""
Local cFrom   := ""
Local cWhere  := ""
Local cQuery  := ""

Local cCursor := ""

Local cPulalinha := Chr(13) + Chr(10)


/*A fun��o Chr() retorna o caractere correspondente ao c�digo ASCII passado como par�metro.

A soma de 13 + 10 � o c�digo ASCII do caractere de quebra de linha, que � representado por \r\n.

/r � o retorno de carro indicando que o cursor deve voltar para o in�cio da linha.
/n � a quebra de linha indicando que o cursor deve ir para a pr�xima linha.

    c�digo ASCII 13 = CR (Carriage Return) = \r    
    c�digo ASCII 10 = LF (Line Feed) = \n
*/


//Preparando ambiente
PREPARE ENVIRONMENT EMPRESA "99" FILIAL "01" MODULO "FIS" TABLES "SF1","SD1","SA1","SA2","SB1","SB2","SF4"

/*Manual da fun��o FWExecStatement
    https://tdn.totvs.com/display/public/framework/FWExecStatement
    https://tdn.totvs.com/display/public/framework/Chr

    Classe derivada da FWPreparedStatement e que encapsula a classe FwExecCachedQuery.

    Ela possui todos os m�todos da FWPreparedStatement (FWPreparedStatement) e utiliza os conceitos do cache de queries(FWExecCachedQuery)

    � utilizada para fazer cache ou n�o das queries executadas e realiza o bind de queries diretamente no banco de dados, o que torna o plano de execu��o das queries melhor aproveitado, gerando ganho de performance.
*/

// Montando a query

    cSelect := " SELECT "       + cPulalinha
    cSelect += " A1_COD"       + cPulalinha
    cSelect += " ,A1_LOJA"      + cPulalinha
    cSelect += " ,A1_PESSOA"    + cPulalinha
    cSelect += " ,A1_NOME"      + cPulalinha
    cSelect += " ,A1_NREDUZ"    + cPulalinha
    cSelect += " ,A1_END"       + cPulalinha
    cSelect += " ,A1_TIPO"      + cPulalinha
    cSelect += " ,A1_EST"       + cPulalinha
    cSelect += " ,A1_MUN"       + cPulalinha
    cSelect += " ,A1_BAIRRO"    + cPulalinha
    cSelect += " ,A1_CGC "      + cPulalinha

    cFrom   := " FROM "+ RetSqlName("SA1") + " SA1 " + cPulalinha

    cWhere  := " WHERE A1_COD = '"+cCodigo+"' " + cPulalinha
    cWhere  += " AND A1_LOJA = '"+cLoja+"' "    + cPulalinha
    cWhere  += " AND A1_TIPO = '"+cTipo+"' "    + cPulalinha
    cWhere  += " AND A1_EST = '"+cEstado+"' "   + cPulalinha

    cQuery := ChangeQuery(cSelect+cFrom+cWhere)

    // Imprime query com os par�metros
    CONOUT("QUERY PRONTA: ", cQuery, cPulalinha )    

    // Executando a query
    cCursor := GetNextAlias()
    DbUseArea( .T., 'TOPCONN', TCGenQry2(,,cQuery,{}), cCursor, .T., .F. )

    // Imprimindo o registro
    while !(cCursor)->(Eof())
        CONOUT( "A1_COD: " + (cCursor)->A1_COD, "A1_LOJA: " + (cCursor)->A1_LOJA )        

        // Avan�a para o pr�ximo registro
        (cCursor)->(DbSkip())
    END

    // Fechando o cursor
    (cCursor)->(DbCloseArea())    

// Encerra o ambiente
RESET ENVIRONMENT

RETURN




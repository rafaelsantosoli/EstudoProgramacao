#INCLUDE "UPDFIS.CH"
#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWLIBVERSION.CH"
#Include "rwmake.ch" 
#Include "topconn.ch" 
#include "fileio.ch" 
#INCLUDE "TBICONN.CH"
 
//#DEFINE X3_USADO_EMUSO          "€€€€€€€€€€€€€€ "   //TORNA USADO POR TODOS OS MODULOS
#DEFINE X3_USADO_EMUSO "x       x       x       x       x       x       x       x       x       x       x       x       x       x       x xx    "
#DEFINE X3_USADO_USADOKEY       "€€€€€€€€€€€€€€°"   //PERMITE ALTERAR SOMENTE O FORMATO E O BROWSE DO USO
#DEFINE X3_USADO_NAOUSADO       "€€€€€€€€€€€€€€€"   //TORNA NAO USADO PELOS MODULOS
#DEFINE X3_RES                  "€€"                //PERMITE ALTERAR OBRIGATORIO, BROWSE E FORMATO
#DEFINE X3_RESER                "þÀ"                //PERMITE ALTERAR ALTERAR USO E ALTERAR MODULOS
#DEFINE X3_RESER_ALTERA_TAM     "–À"                //PERMITE ALTERAR ALTERAR USO E ALTERAR MODULOS E TAMANHO DO CAMPO
#DEFINE X3_RESER_ALT_TAM_DEC    "Ü+"                //PERMITE ALTERAR ALTERAR USO E ALTERAR MODULOS E TAMANHO DO CAMPO E DECIMAL
#DEFINE X3_RESER_NUMERICO       "øÇ"                //PERMITE ALTERAR ALTERAR USO E ALTERAR MODULOS E TAMANHO DO CAMPO E DECIMAL
#DEFINE X3_RESERKEY             "ƒ€"                //PERMITE ALTERAR SOMENTE O BROWSE DO USO
#DEFINE X3_RESNAO               "›€"                //PERMITE ALTERAR SOMENTE O FORMATO E O BROWSE DO USO
#DEFINE X3_OBRIGATORIO          "Á€"                //TORNA OBRIGATORIO
#DEFINE X3_NAOOBRIGAT           "šÀ"                //TORNA NAO OBRIGATORIO


User Function update(lWizard)
Local   aEmpr       :=  {}
Local   cTxtIntro   :=  ""
Local   cLog        :=  ""
Local   lOpen       :=  .F.
Local   oDlgUpd     :=  Nil
Local   oProcess    :=  Nil

DEFAULT lWizard     := .F.
If ValType(lWizard)!= "L"
	lWizard := .F.
EndIf
Private nModulo     :=  44
Private lMsFinalAuto:=  .F.

Private cDescTitle  := 'Compatibilizador'  //Alterar nesta variável o mês, quando necessário.

Set Deleted On

cTxtIntro += "<table width='100%' border=2 cellpadding='15' cellspacing='5'>"
cTxtIntro += "<tr>"
cTxtIntro += "<td colspan='5' align='center'><font face='Tahoma' size='+2'>"
cTxtIntro += "</font></td>"
cTxtIntro += "</tr>"
cTxtIntro += "<tr>"
cTxtIntro += "<td colspan='5'><font face='Tahoma' color='#000099' size='+1'>"
cTxtIntro += "<b>Este programa tem por objetivo compatibilizar o ambiente do cliente "
cTxtIntro += "<br><br><br><br><br><br><br><br><br><br>"
cTxtIntro += "</font></td>"
cTxtIntro += "</tr>"
cTxtIntro += "</table>"

If MyOpenSM087(lOpen)
    SM0->( DbEval( {|| If(AScan(aEmpr, {|x| x[1] == FWGrpCompany()}) == 0, AAdd(aEmpr, {FWGrpCompany(),FWCodFil(),RecNo()}), .T.) },, {|| !SM0->(Eof())}) )
    
    IF !lWizard
        DEFINE MSDIALOG oDlgUpd TITLE cDescTitle FROM 00,00 TO 500,700 PIXEL
        
        TSay():New(005,005,{|| cTxtIntro },oDlgUpd,,,,,,.T.,,,340,200,,,,.T.,,.T.)
        TButton():New( 220,180, '&Processar...', oDlgUpd,{|| RpcClearEnv(), oProcess := MsNewProcess():New( {|| FIS87Upd(aEmpr, oProcess) }, 'Aguarde...', 'Iniciando Processamento...', .F.), oProcess:Activate(), oDlgUpd:End()},075,015,,,,.T.,,,,,,)
        TButton():New( 220,270, '&Cancelar', oDlgUpd,{|| RpcClearEnv(), oDlgUpd:End()},075,015,,,,.T.,,,,,,)
        
        ACTIVATE MSDIALOG oDlgUpd CENTERED
    Else
        cLog    :=  FIS87Upd(aEmpr, oProcess,lWizard)
    EndIF
EndIf
RpcClearEnv()
Return (cLog)

/*³Descri‡„o ³Funcao responsavel pela chamadas das funcoes de processamento e apresentacao do resultado final.³*/
Static Function FIS87Upd(aEmpr, oProcess, lWizard)
Local aArqUpd   :=  {}
Local aResumo   :=  {}
Local cTxtIntro :=  ''
Local lOk       :=  .F.
Local lOpen     :=  .F.
Local nCount    :=  0
Local oDlg      :=  Nil
Local aSFV      :=  {}
Local aSFW      :=  {}
Local cDriver   :=  ""
Local cTxt      := ""
#IFNDEF TOP
    Local cDelInd   := ''
#ENDIF

DEFAULT lWizard := .F.

IF !lWizard
    oProcess:SetRegua1(Len(aEmpr))
Else
    RpcClearEnv()
EndIf

For nCount := 1 To Len(aEmpr)
    If MyOpenSM087(lOpen)
        
        SM0->(DbGoTo(aEmpr[nCount,3]))
        RpcSetType(3)
        RpcSetEnv(aEmpr[nCount,1], aEmpr[nCount,2])
        cDriver :=  __CRDD
        IF !lWizard
            oProcess:SetRegua2(10)
            oProcess:IncRegua1('Processando Empresa: ' + SM0->(M0_CODIGO + ' - ' + AllTrim(M0_NOME)))
        EndIF
        AAdd( aResumo,  {   { SM0->(M0_CODIGO + ' - ' + AllTrim(M0_NOME))},;
        {/*Atualizacoes SX1*/},;
        {/*SX2*/},;
        {/*SX3*/},;
        {/*SIX*/},;
        {/*SX5*/},;
        {/*SX6*/},;
        {/*SX7*/},;
        {/*SXA*/},;
        {/*SXB*/},;
        {/*SXG*/},;
        {/*Banco de dados*/ } } )
        If cPaisLoc == "BRA"
            //³Atualizacao dos Indices do sistema (SIX)³
            FISAtSIX(oProcess, @aArqUpd, @aResumo,lWizard)
            //³Atualizando tabelas do sistema, SX2 ³
            FISAtSX2(oProcess, @aArqUpd, @aResumo,lWizard)
            //³Atualizando dicionario de dados, SX3³
            FISAtSX3(oProcess, @aArqUpd, @aResumo, @aSFV, @aSFW,lWizard)
    				

            lOk := FISUpdTable(oProcess, aArqUpd, @aResumo,lWizard) //Compatibilizacao do BD
			
            If !lOk
                IF !lWizard
                    cTxtIntro += "<table width='100%' border=2 cellpadding='15' cellspacing='5'>"
                    cTxtIntro += "<tr>"
                    cTxtIntro += "<td colspan='5' align='center'><font face='Tahoma' size='+2'>"
                    cTxtIntro += "<b>FALHA NA ATUALIZACAO</b>"
                    cTxtIntro += "</font></td>"
                    cTxtIntro += "</tr>"
                    cTxtIntro += "<tr>"
                    cTxtIntro += "<td colspan='5'><font face='Tahoma' color='#FF0000' size='+1'>"
                    cTxtIntro += "<b>Ocorreu uma falha durante a atualização das tabelas envolvidas no "
                    cTxtIntro += "processo. Por favor, verifique a falha através do LOG de atualizações.<br>"
                    cTxtIntro += "Após a correção das falhas, retorne a cópia de segurança do dicionário (SX's) e<br>"
                    cTxtIntro += "banco de dados e execute novamente o compatibilizador.</b><br><br>"
                    cTxtIntro += "<br><br><br><br><br><br><br><br><br><br><br>"
                    cTxtIntro += "</font></td>"
                    cTxtIntro += "</tr>"
                    cTxtIntro += "</table>"
                    DEFINE MSDIALOG oDlg TITLE cDescTitle FROM 00,00 TO 500,700 PIXEL
                    TSay():New(005,005,{|| cTxtIntro },oDlg,,,,,,.T.,,,340,200,,,,.T.,,.T.)
                    TButton():New( 220,270, '&Ok', oDlg,{|| RpcClearEnv(), oDlg:End()},075,015,,,,.T.,,,,,,)
                    ACTIVATE MSDIALOG oDlg CENTERED
                    oProcess:IncRegua2( 'Restaurando ambiente...' )
                Else
                    cTxt:= "Ocorreu uma falha durante a atualização das tabelas envolvidas no "
                    cTxt+= "processo. Por favor, verifique a falha através do LOG de atualizações. "
                    cTxt+= "Após a correção das falhas, retorne a cópia de segurança do dicionário (SX's) e "
                    cTxt+= "banco de dados e execute novamente o compatibilizador."
                    cTxt+= CHR(13) + CHR(10)
                    cTxt+= Replicate('=',40) + CHR(13) + CHR(10)
                    cTxt+= Replicate('=',40) + CHR(13) + CHR(10)
                EndIF
                EXIT 
            EndIf
        EndIf
        RpcClearEnv()
    EndIf
Next nCount
cTxt+=FIShowLog(oProcess,aResumo,.f.,lWizard)
Return (cTxt)

/*
³Descri‡„o ³Funcao de atualizacao do dicionario de tabelas (SX2)        ³
*/
Function FISAtSX2(oProcess, aArqUpd, aResumo,lWizard)
Local aSX2   	:= 	{}
Local aEstrut	:= 	{}
Local cPath		:=	""
Local cNome		:=	""                                                   
Local nI      	:= 	0
Local nJ      	:= 	0
DEFAULT lWizard	:= .F.

If !lWizard
	oProcess:IncRegua2( 'Atualizando Tabelas (SX2)' )
EndIF

aEstrut:={"X2_CHAVE" , "X2_NOME" , "X2_NOMESPA" , "X2_NOMEENG" , "X2_MODO" , "X2_ROTINA" , "X2_UNICO" , "X2_MODOUN" , "X2_MODOEMP","X2_DISPLAY"}

dbSelectArea("SX2")
dbSetOrder(1)

//enquadramento de IPI
aAdd(aSX2,{"Z01","Cadastro Cliente","Cadastro Cliente","Cadastro Cliente","C","","Z01_FILIAL+Z01_COD+Z01_LOJA","C","C",""})

SX2->(dbGoTop())
cPath := SX2->X2_PATH
cNome := cEmpAnt+"0"
For nI := 1 To Len(aSX2)
	If !Empty(aSX2[nI][1])
		If !SX2->(dbSeek(aSX2[nI,1]))
			RecLock("SX2",.T.)
			For nJ:=1 To Len(aSX2[nI])
				If SX2->(FieldPos(aEstrut[nJ]))>0
					SX2->(FieldPut(FieldPos(aEstrut[nJ]),aSX2[nI,nJ]))
				EndIf
			Next nJ
			SX2->X2_PATH 	:= 	cPath
			SX2->X2_ARQUIVO	:= 	aSX2[nI,1]+cNome
			SX2->X2_DELET	:=	0
			SX2->X2_TTS		:=	""
			SX2->X2_PYME	:=	"S"
			SX2->X2_MODULO	:=	9
			SX2->(dbCommit())
			SX2->(MsUnLock())
			aAdd(aArqUpd,aSX2[nI,1])
			AAdd( aResumo[Len(aResumo)][3], aSX2[nI,1] + ' - ' + aSX2[nI,4] ) //Atualiza informacoes para montagem-do log de processamento:
		EndIf
	EndIf
Next nI

Return



/*
±±³Descri‡„o ³Funcao de atualizacao do dicionario de tabelas (SX3)        ³±±
*/
Static Function FISAtSX3(oProcess, aArqUpd, aResumo, aSFV, aSFW,lWizard)
Local aSX3      := {}
Local cOrdem    := ""
Local i         := 0
Local j         := 0
Local oX3       := nil

//Estrutura para gravacao dos itens no SX3
Local aEstrut:= {   "X3_ARQUIVO","X3_ORDEM"  ,"X3_CAMPO"  ,;
"X3_TIPO"   ,"X3_TAMANHO","X3_DECIMAL",;
"X3_TITULO" ,"X3_TITSPA" ,"X3_TITENG" ,;
"X3_DESCRIC","X3_DESCSPA","X3_DESCENG",;
"X3_PICTURE","X3_VALID"  ,"X3_USADO"  ,;
"X3_RELACAO","X3_F3"     ,"X3_NIVEL"  ,;
"X3_RESERV" ,"X3_CHECK"  ,"X3_TRIGGER",;
"X3_PROPRI" ,"X3_BROWSE" ,"X3_VISUAL" ,;
"X3_CONTEXT","X3_OBRIGAT","X3_VLDUSER",;
"X3_CBOX"   ,"X3_CBOXSPA","X3_CBOXENG",;
"X3_PICTVAR","X3_WHEN"   ,"X3_INIBRW" ,;
"X3_GRPSXG" ,"X3_FOLDER" ,"X3_PYME"}

Default aSFV        :=  {}
Default aSFW        :=  {}
DEFAULT lWizard     := .F.

IF !lWizard
    oProcess:IncRegua2( 'Atualizando Dicionario de Dados (SX3)' )
EndIF

dbSelectArea("SX3")
SX3->(dbSetOrder(2))
/*
|X3_ARQUIVO|	X3_ORDEM|	X3_CAMPO|	X3_TIPO|	X3_TAMANHO|	X3_DECIMAL|	X3_TITULO |
|--|--|--|--|--|--|--|
|Z01	|01	|Z01_FILIAL 	|C	|8|	0|	Filial      |
|Z01	|02	|Z01_COD    	|C	|6|	0|	Codigo      |
|Z01	|03	|Z01_LOJA   	|C	|2|	0|	Loja        |
|Z01	|04	|Z01_PESSOA 	|C	|1|	0|	Fisica/Jurid|
|Z01	|05	|Z01_NOME   	|C	|40|	0|	Nome        |
|Z01	|06	|Z01_NREDUZ 	|C	|20|	0|	N Fantasia  |
|Z01	|07	|Z01_END    	|C	|40|	0|	Endereco    |
|Z01	|08	|Z01_TIPO   	|C	|1|	0|	Tipo        |
|Z01	|09	|Z01_EST    	|C	|2|	0|	Estado      |
|Z01	|12	|Z01_MUN    	|C	|60|	0|	Municipio   |
|Z01	|13	|Z01_BAIRRO 	|C	|30|	0|	Bairro      |
|Z01	|14	|Z01_IBGE   	|C	|11|	0|	Cod.IBGE    |
|Z01	|15	|Z01_NATUREZ	|C	|10|	0|	Natureza    |
|Z01	|16	|Z01_CEP    	|C	|8|	0|	CEP         |
|Z01	|17	|Z01_DDI    	|C	|6|	0|	DDI         |
|Z01	|18	|Z01_DDD    	|C	|3|	0|	DDD         |
|Z01	|19	|Z01_TEL    	|C	|15|	0|	Telefone    |
|Z01	|23	|Z01_PAIS   	|C	|3|	0|	Pais        |
|Z01	|27	|Z01_CGC    	|C	|14|	0|	CNPJ/CPF    |
|Z01	|28	|Z01_CONTATO	|C	|15|	0|	Contato     |
*/
//INICIO DO TRECHO DE TRATAMENTO DA CRIAÇÃO DOS CAMPOS ATRAVÉS DA CLASSE UPDGEN

oX3 := UPDGEN():New()//Cria objeto SX3
oX3:SX3(@aSX3)//passa array para a classe

oX3:Campo('Z01','Z01_FILIAL')
ox3:Tipo('C',2,0,'@!')
oX3:Tit('Filial','Filial')
oX3:GRP('033')
oX3:Hlp({'Campo de filial'})

oX3:Campo('Z01','Z01_COD')
ox3:Tipo('C',6,0,'@!')
oX3:Tit('Codigo','Código')
oX3:GRP('001')
oX3:Hlp({'Campo de Código'})

oX3:Campo('Z01','Z01_LOJA')
ox3:Tipo('C',2,0,'@!')
oX3:Tit('Loja','loja')
oX3:GRP('002')
oX3:Hlp({'Campo de Loja'})

oX3:Campo('Z01','Z01_PESSOA')
ox3:Tipo('C',1,0,'@!')
ox3:Box('F=Fisica;J=Juridica')
oX3:Tit('Fisica/Jurid','Fisica/Jurid')
oX3:Hlp({'Campo de Fisica/Jurid'})

oX3:Campo('Z01','Z01_NOME')
ox3:Tipo('C',40,0,'@!')
oX3:Tit('Nome','Nome')
oX3:Hlp({'Campo de Nome'})

oX3:Campo('Z01','Z01_NREDUZ')
ox3:Tipo('C',20,0,'@!')
oX3:Tit('N Fantasia','N Fantasia')
oX3:Hlp({'Campo de N Fantasia'})

oX3:Campo('Z01','Z01_END')
ox3:Tipo('C',40,0,'@!')
oX3:Tit('Endereco','Endereco')
oX3:Hlp({'Campo de Endereco'})

oX3:Campo('Z01','Z01_TIPO')
ox3:Tipo('C',1,0,'@!')
ox3:Box('F=Cons.Final;L=Produtor Rural;R=Revendedor;S=Solidario;X=Exportacao')
ox3:Vld('pertence("FLRSX")')
oX3:Tit('Tipo','Tipo')
oX3:Hlp({'Campo de Tipo'})

oX3:Campo('Z01','Z01_EST')
ox3:Tipo('C',2,0,'@!')
oX3:F3('12')
ox3:Vld('ExistCpo("SX5","12"+M->Z01_EST)')
oX3:Tit('Estado','Estado')
oX3:Hlp({'Campo de Estado'})

oX3:Campo('Z01','Z01_MUN')
ox3:Tipo('C',60,0,'@!')
oX3:Tit('Municipio','Municipio')
oX3:Hlp({'Campo de Municipio'})

oX3:Campo('Z01','Z01_BAIRRO')
ox3:Tipo('C',30,0,'@S15')
oX3:Tit('Bairro','Bairro')
oX3:Hlp({'Campo de Bairro'})

oX3:Campo('Z01','Z01_IBGE')
ox3:Tipo('C',11,0,'@!')
ox3:Vld('Vazio() .or. ExistCpo("VAM")')
oX3:F3('AM1')
oX3:Tit('Cod.IBGE ','Cod.IBGE ')
oX3:Hlp({'Campo de Cod.IBGE '})

oX3:Campo('Z01','Z01_NATUREZ')
ox3:Tipo('C',10,0,'@!')
ox3:Vld('vazio() .or. ExistCpo("SED")')
oX3:F3('SED')
oX3:Tit('Natureza ','Natureza ')
oX3:Hlp({'Campo de Natureza '})

oX3:Campo('Z01','Z01_CEP')
ox3:Tipo('C',8,0,'@R 99999-999')
oX3:Tit('CEP ','CEP ')
oX3:Hlp({'Campo de CEP '})

oX3:Campo('Z01','Z01_DDI')
ox3:Tipo('C',6,0,'999999')
oX3:Tit('DDI ','DDI ')
oX3:Hlp({'Campo de DDI '})

oX3:Campo('Z01','Z01_DDD')
ox3:Tipo('C',3,0,'999')
oX3:Tit('DDD ','DDD ')
oX3:Hlp({'Campo de DDD '})

oX3:Campo('Z01','Z01_TEL')
ox3:Tipo('C',15,0,'@R 9999999999')
oX3:Tit('Telefone ','Telefone ')
oX3:Hlp({'Campo de Telefone '})

oX3:Campo('Z01','Z01_PAIS')
ox3:Tipo('C',3,0,'@!')
ox3:Vld('vazio() .or. ExistCpo("SYA")')
oX3:F3('SYA')
oX3:Tit('Pais ','Pais ')
oX3:Hlp({'Campo de Pais '})

oX3:Campo('Z01','Z01_CGC')
ox3:Tipo('C',14,0,'@R 99.999.999/9999-99')
ox3:Vld('Vazio() .Or. IIF( M->Z01_TIPO == "X", .T., (CGC(M->Z01_CGC) .And. A030CGC(M->Z01_PESSOA, M->Z01_CGC) .And. A030VldUCod() ))')
oX3:Tit('CNPJ/CPF ','CNPJ/CPF ')
oX3:Hlp({'Campo de CNPJ/CPF'})

oX3:Campo('Z01','Z01_CONTATO')
ox3:Tipo('C',15,0,'@!')
oX3:Tit('Contato ','Contato ')
oX3:Hlp({'Campo de Contato '})

//Destroi o objeto e limpa da memória
FreeObj(oX3)
oX3 := Nil

BEGIN TRANSACTION

For i:= 1 To Len(aSX3)
	If !Empty(aSX3[i][1])
		//A ordem sera analisada no momento da gravacao visto que³a base pode conter alguns dos cam  pos informados neste
		//fonte para gravacao. Neste caso, se definissemos a ordem³no momento da criacao do array aSX3, algumas ordem ficariam perdidas no SX3.
		If !dbSeek(PadR(aSX3[i,3],Len(SX3->X3_CAMPO)))
			cOrdem      := ProxOrdem87(aSX3[i,1])
			aSX3[i,2]   := cOrdem
			RecLock("SX3",.T.)
			For j:=1 To Len(aSX3[i])
				If FieldPos(aEstrut[j])>0
					If aEstrut[j] $ "X3_NIVEL/X3_TAMANHO/X3_DECIMAL" .And. Valtype(aSX3[i,j]) == "C"
						FieldPut(FieldPos(aEstrut[j]),Val(aSX3[i,j]))
					ElseIf aEstrut[j] $ "X3_OBRIGAT" .And. Valtype(aSX3[i,j]) <> "C"
						FieldPut(FieldPos(aEstrut[j]),"")
					ElseIf aEstrut[j] $ "X3_CONTEXT" 							
						If Valtype(aSX3[i,j]) == "C" .And. !Empty(aSX3[i,j])
							FieldPut(FieldPos(aEstrut[j]),aSX3[i,j])
						Else
							FieldPut(FieldPos(aEstrut[j]),"R")								
						EndIf							
					Else
						FieldPut(FieldPos(aEstrut[j]),aSX3[i,j])
					EndIf
				EndIf
			Next j
			//Tratamento para o campo filial
			If "_FILIAL" $ aSX3[i,3]
				SX3->X3_GRPSXG  :=  "033"
				SX3->X3_TAMANHO :=  FWGETTAMFILIAL
			EndIf
			SX3->X3_PROPRI := "S"
			SX3->X3_PYME   := "S"
			dbCommit()
			MsUnLock()
			AAdd( aResumo[Len(aResumo)][4], aSX3[i,1] + ' - ' + aSX3[i,3] )
			aAdd(aArqUpd,aSX3[i,1])
		Endif
	EndIf
Next i

END TRANSACTION

Return


/*

±±³Descri‡…o ³ Funcao de processamento da gravacao do SIX                 ³±±
*/
Static Function FISAtSIX(oProcess, aArqUpd, aResumo,lWizard)
Local aSix      := {}
Local aEstrut   := {}
Local aOld      := {}
Local lDelInd   := .F.
Local nOld      := 0
Local nI        := 0
Local nJ        := 0

#IFNDEF TOP
    Local cDelInd   := ''
#ENDIF

DEFAULT lWizard := .F.

IF !lWizard
    oProcess:IncRegua2( 'Atualizando Indices (SIX)' )//Atualiza barra de progresso
EndIF

aEstrut:= {"INDICE","ORDEM","CHAVE","DESCRICAO","DESCSPA","DESCENG","PROPRI","F3","NICKNAME","SHOWPESQ"}

//---------------------------------------- ATUALIZACOES/CORRECOES -------------------------------------------


//---------------------------------------- NOVOS INDICES NO SIX ----------------------------------------------------

//Enquadramento IPI
Aadd(aSIX,{"Z01","1","Z01_FILIAL+Z01_COD+Z01_LOJA","Codigo+loja","Codigo+loja","Codigo+loja","S","","","S"})

dbSelectArea("SIX")
SIX->(DbSetOrder(1))

For nI := 1 To Len(aSIX)
    If !Empty(aSIX[nI,1])
        If MsSeek(aSIX[nI,1]+aSIX[nI,2])
            If SIX->PROPRI<>"S"
                aOld := {}
                While !Eof() .And. SIX->INDICE==aSIX[nI,1]
                    aadd(aOld,SIX->(RecNo()))
                    dbSelectArea("SIX")
                    dbSkip()
                EndDo
                For nOld := 1 To Len(aOld)
                    SIX->(MsGoto(aOld[nOld]))
                    //Exclui sem precisar baixar o TOP
                    TcInternal(60,RetSqlName(aSix[nI,1]) + "|" + RetSqlName(aSix[nI,1]) + SIX->ORDEM)
                    RecLock("SIX")
                    SIX->ORDEM := Soma1(SIX->ORDEM,Len(SIX->ORDEM))
                    MsUnLock()
                Next nOld
            EndIf
            lDelInd := .T. //Se for alteracao precisa apagar o indice do banco
        Else
            lDelInd := .F.
        EndIf
        If !MsSeek(aSIX[nI,1]+aSIX[nI,2])
            RecLock("SIX",.T.)
        Else
            RecLock("SIX",.F.)
        EndIf
        If UPPER(AllTrim(CHAVE)) != UPPER(Alltrim(aSIX[nI,3]))
            aAdd(aArqUpd,aSIX[nI,1])
            For nJ:=1 To Len(aSIX[nI])
                If FieldPos(aEstrut[nJ])>0
                    FieldPut(FieldPos(aEstrut[nJ]),aSIX[nI,nJ])
                EndIf
            Next nJ
            dbCommit()
            MsUnLock()
            If lDelInd
                #IFDEF TOP
                    TcInternal(60,RetSqlName(aSix[nI,1]) + "|" + RetSqlName(aSix[nI,1]) + aSix[nI,2]) //Exclui sem precisar baixar o TOP
                #ELSE
                    cDelInd += aSix[nI,1]+"/"
                #ENDIF
            Endif
        EndIf
        AAdd( aResumo[Len(aResumo)][5], aSIX[nI,1] + ' - ' + aSIX[nI,2] + ' - ' + aSIX[nI,3] )
                
    EndIf
Next nI

Return


/*
±±³Descri‡…o ³ Efetua a abertura do SM0 exclusivo                         ³±±
*/
Static Function MyOpenSM087(lOpen)

Local nLoop := 0

For nLoop := 1 To 20
        OpenSm0()
		If !Empty( Select( "SM0" ) ) 
			lOpen := .T.
			If !MPDicInDB() //Verifica se dicionários de dados no SGBD.
				If File("SIGAMAT.IND")
					dbSetIndex("SIGAMAT.IND")
				EndIf
			EndIf
			Exit
		EndIf
		Sleep( 500 )
Next nLoop

If !lOpen
    MsgStop("Nao foi possivel a abertura da tabela de empresas de forma exclusiva!","Atencao!")
EndIf
Return( lOpen )

/*

±±ºDesc.     ³Verifica a proxima ordem no SX3 para criacao de novos camposº±±
*/
Static Function ProxOrdem87(cTabela,cOrdem)

Local aOrdem    := {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","X","W","Y","Z"}
Local cProxOrdem87:= ""
Local nX        := 0
Local aAreaSX3 := SX3->(GetArea())

Default cOrdem  := ""

// Verificando a ultima ordem utilizada
If Empty(cOrdem)
    dbSelectArea("SX3")
    dbSetOrder(1)
    If MsSeek(cTabela)
        Do While SX3->X3_ARQUIVO == cTabela .And. !SX3->(Eof())
            cOrdem := SX3->X3_ORDEM
            SX3->(dbSkip())
        Enddo
    Else
        cOrdem := "00"
    EndIf
Endif

// Criando a nova ordem para o cadastro do novo campo
If Val(SubStr(cOrdem,2,1)) < 9
    cProxOrdem87  := SubStr(cOrdem,1,1) + Str((Val(SubStr(cOrdem,2,1))+1),1)
Else
    For nX := 1 To Len(aOrdem)
        If aOrdem[nX] == SubStr(cOrdem,1,1)
            Exit
        Endif
    Next
    If nX == Len(aOrdem)
        cProxOrdem87 := Soma1(cOrdem)
    Elseif nX < Len(aOrdem)
        cProxOrdem87 := aOrdem[nX+1] + "0"
    else    
    	 cProxOrdem87 := ''
    EndIf
Endif
SX3->(RestArea(aAreaSX3))

Return cProxOrdem87

/*
±±³Descri‡…o ³ Processa as atualizacoes no banco de dados.                 ³±±
*/
Static Function FISUpdTable(oProcess, aArqUpd, aResumo,lWizard)

Local lRet := .T.
Local nX
Local nPos

DEFAULT lWizard := .F.

IF !lWizard
    oProcess:IncRegua2('Compatibilizando Banco de Dados' ) //Atualiza barra de progresso...
EndIF

__SetX31Mode(.F.)
For nX := 1 To Len(aArqUpd)
    If Select(aArqUpd[nx])>0
        dbSelecTArea(aArqUpd[nx])
        dbCloseArea()
    EndIf
    X31UpdTable(aArqUpd[nx])
    nPos := Len(aResumo)
    AAdd( aResumo[nPos][12], {aArqUpd[nx], '', ''})
    If __GetX31Error()
        aResumo[nPos][12][Len(aResumo[nPos][12])][2] := STR0014 + aArqUpd[nx] + STR0015
        aResumo[nPos][12][Len(aResumo[nPos][12])][3] := __GetX31Trace()
        Return( .F. )
    Else
        aResumo[nPos][12][Len(aResumo[nPos][12])][2] := "Tabela Atualizada com sucesso!"
    EndIf
Next nX

aArqUpd := {}

Return( lRet )

/*
±±³Descri‡…o ³ Mostra o Log de atualizacoes do UPDFIS                      ³±±
*/
Static Function FIShowLog( oProcess, aResumo, lProcInt,lWizard )

Local cTxt      := ''
Local cFileLog  := ''
Local cTxtIntro := ''
Local cFile     := ''
Local cMask     := "Arquivos Texto (*.TXT) |*.txt|"

Local nX        := 0
Local nY        := 0

Local oDlgLog   := NIL
Local oMemo     := NIL

Default lProcInt:=  .F.
DEFAULT lWizard := .F.

IF !lWizard
    oProcess:SetRegua1(Len(aResumo))
EndIF

For nX := 1 To Len(aResumo)
    IF !lWizard
        oProcess:IncRegua1( 'LOG -> Empresa: ' + aResumo[nX][1][1]  )
    EndIf
    cTxt += Replicate('=',40) + CHR(13) + CHR(10)
    cTxt += "Atualização: Empresa " + aResumo[nX][1][1] + CHR(13) + CHR(10)
    cTxt += Replicate('=',40) + CHR(13) + CHR(10)
    cTxt += CHR(13) + CHR(10)
    
    IF !lWizard
        oProcess:SetRegua2(Len(aResumo[nX]))
        oProcess:IncRegua2( 'Atualizações: Grupo de perguntas (SX1)' )
    EndIF
    
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Grupo de perguntas (SX1) - Novos Grupos Criados:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][2]) > 0
        For nY := 1 To Len(aResumo[nX][2])
            cTxt += Iif(!Empty(aResumo[nX][2][nY]),AllTrim(aResumo[nX][2][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Tabelas do Sistema (SX2)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Tabelas do Sistema (SX2) - Novas Tabelas:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][3]) > 0
        For nY := 1 To Len(aResumo[nX][3])
            cTxt += Iif(!Empty(aResumo[nX][3][nY]),AllTrim(aResumo[nX][3][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Dicionário de Campos (SX3)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Dicionário de Campos (SX3) - Campos Criados/Atualizados:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][4]) > 0
        For nY := 1 To Len(aResumo[nX][4])
            cTxt += Iif(!Empty(aResumo[nX][4][nY]),AllTrim(aResumo[nX][4][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Indíces do Sistema (SIX)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Indíces do Sistema (SIX) - Novos Indíces Criados:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][5]) > 0
        For nY := 1 To Len(aResumo[nX][5])
            cTxt += Iif(!Empty(aResumo[nX][5][nY]),AllTrim(aResumo[nX][5][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações:  Tabelas Genéricas (SX5)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações:  Tabelas Genéricas (SX5) - Novos Tabelas Criadas:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][6]) > 0
        For nY := 1 To Len(aResumo[nX][6])
            cTxt += Iif(!Empty(aResumo[nX][6][nY]),AllTrim(aResumo[nX][6][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Parâmetros (SX6)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Parâmetros (SX6) - Novos Parâmetros Criados:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][7]) > 0
        For nY := 1 To Len(aResumo[nX][7])
            cTxt += Iif(!Empty(aResumo[nX][7][nY]),AllTrim(aResumo[nX][7][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Gatilhos (SX7)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Gatilhos (SX7) - Novos Gatilhos Criados:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][8]) > 0
        For nY := 1 To Len(aResumo[nX][8])
            cTxt += Iif(!Empty(aResumo[nX][8][nY]),AllTrim(aResumo[nX][8][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Folders (Pastas) (SXA)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Folders (Pastas) (SXA) - Novas Pastas Criadas:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][9]) > 0
        For nY := 1 To Len(aResumo[nX][9])
            cTxt += Iif(!Empty(aResumo[nX][9][nY]),AllTrim(aResumo[nX][9][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Consultas Padrões (SXB)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Consultas Padrões (SXB) - Novas Consultas Criadas:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][10]) > 0
        For nY := 1 To Len(aResumo[nX][10])
            cTxt += Iif(!Empty(aResumo[nX][10][nY]),AllTrim(aResumo[nX][10][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf

    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Grupo de Campos (SXG)' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Grupo de Campos (SXG) - Novos Grupos Criados:" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][11]) > 0
        For nY := 1 To Len(aResumo[nX][11])
            cTxt += Iif(!Empty(aResumo[nX][11][nY]),AllTrim(aResumo[nX][11][nY]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    
    IF !lWizard
        oProcess:IncRegua2( 'Atualizações: Banco de Dados' )
    EndIF
    cTxt += CHR(13) + CHR(10)
    cTxt += "Atualizações: Banco de Dados" + CHR(13) + CHR(10)
    cTxt += Replicate('-',40) + CHR(13) + CHR(10)
    If Len(aResumo[nX][12]) > 0
        For nY := 1 To Len(aResumo[nX][12])
            cTxt += Iif(!Empty(aResumo[nX][12][nY][1]),AllTrim(aResumo[nX][12][nY][1]) + CHR(13) + CHR(10),"")
            cTxt += Iif(!Empty(aResumo[nX][12][nY][2]),AllTrim(aResumo[nX][12][nY][2]) + CHR(13) + CHR(10),"")
            cTxt += Iif(!Empty(aResumo[nX][12][nY][3]),AllTrim(aResumo[nX][12][nY][3]) + CHR(13) + CHR(10),"")
        Next
    Else
        cTxt += "NENHUMA ATUALIZAÇÃO REALIZADA" + CHR(13) + CHR(10)
    EndIf
    cTxt += CHR(13) + CHR(10)
    
	//mostrando o arquivo por empresa 
If !Empty(cTxt) .and. len(cTxt) >= 512000 //nao pode ser maior que um mega, alterado para 512000 para evitar chegar em  1024000 
    cFileLog := MemoWrite(Criatrab(,.f.)+".LOG",cTxt)
    
    IF !lWizard
        cTxtIntro += "<table width='100%' border=2 cellpadding='15' cellspacing='5'>"
        cTxtIntro += "<tr>"
        cTxtIntro += "<td align='center'>"
        cTxtIntro += "<font face='Tahoma' size='+2'><b>LOG DAS ATUALIZAÇÕES</b></font>"
        cTxtIntro += "</td>"
        cTxtIntro += "</tr>"
        cTxtIntro += "<tr>"
        cTxtIntro += "<td>teste"
        cTxtIntro += "<br><br><br><br><br><br><br><br><br>"
        cTxtIntro += "<br><br><br><br><br><br><br><br><br>"
        cTxtIntro += "</td>"
        cTxtIntro += "</tr>"
        cTxtIntro += "</table>"
        
        DEFINE MSDIALOG oDlgLog TITLE cDescTitle FROM 00,00 TO 500,700 PIXEL
        
        TSay():New(005,005,{|| cTxtIntro },oDlgLog,,,,,,.T.,,,340,200,,,,.T.,,.T.)
        @ 045,015 GET oMemo VAR cTxt MEMO SIZE 320,150 OF oDlgLog PIXEL READONLY
        TButton():New( 220,180, '&Salvar...', oDlgLog,{|| cFile := cGetFile(cMask,""), If(cFile="", .T., MemoWrite(cFile,cTxt)) },075,015,,,,.T.,,,,,,)
        TButton():New( 220,270, '&Ok', oDlgLog,{|| RpcClearEnv(), oDlgLog:End()},075,015,,,,.T.,,,,,,)
        
        ACTIVATE MSDIALOG oDlgLog CENTERED
    EndIF
		cTxt := ""
EndIf
Next nX

If lProcInt
    cTxt    :=  "Processo de atualização interrompido!"
EndIf
                        
//mostrando o arquivo por empresa 
If !Empty(cTxt)
    cFileLog := MemoWrite(Criatrab(,.f.)+".LOG",cTxt)
    
    IF !lWizard
        cTxtIntro += "<table width='100%' border=2 cellpadding='15' cellspacing='5'>"
        cTxtIntro += "<tr>"
        cTxtIntro += "<td align='center'>"
        cTxtIntro += "<font face='Tahoma' size='+2'><b>LOG DAS ATUALIZAÇÕES</b></font>"
        cTxtIntro += "</td>"
        cTxtIntro += "</tr>"
        cTxtIntro += "<tr>"
        cTxtIntro += "<td>teste"
        cTxtIntro += "<br><br><br><br><br><br><br><br><br>"
        cTxtIntro += "<br><br><br><br><br><br><br><br><br>"
        cTxtIntro += "</td>"
        cTxtIntro += "</tr>"
        cTxtIntro += "</table>"
        
        DEFINE MSDIALOG oDlgLog TITLE cDescTitle FROM 00,00 TO 500,700 PIXEL
        
        TSay():New(005,005,{|| cTxtIntro },oDlgLog,,,,,,.T.,,,340,200,,,,.T.,,.T.)
        @ 045,015 GET oMemo VAR cTxt MEMO SIZE 320,150 OF oDlgLog PIXEL READONLY
        TButton():New( 220,180, '&Salvar...', oDlgLog,{|| cFile := cGetFile(cMask,""), If(cFile="", .T., MemoWrite(cFile,cTxt)) },075,015,,,,.T.,,,,,,)
        TButton():New( 220,270, '&Ok', oDlgLog,{|| RpcClearEnv(), oDlgLog:End()},075,015,,,,.T.,,,,,,)
        
        ACTIVATE MSDIALOG oDlgLog CENTERED
    EndIF
EndIf

Return (cTxt)



CLASS UPDGEN
    //Variaveis da classe
    Data aSX3       As Array HIDDEN
    Data cTabela    As String HIDDEN
    Data cOrdem     As String HIDDEN
    Data cCampo     As String HIDDEN
    Data cTipo      As String HIDDEN
    Data nTamanho   As Integer HIDDEN
    Data nDecimal   As Integer HIDDEN
    Data cTitulo    As String HIDDEN
    Data cDescr     As String HIDDEN
    Data cPicture   As String HIDDEN
    Data cValid     As String HIDDEN
    Data cUsado     As String HIDDEN
    Data cRelac     As String HIDDEN
    Data cF3        As String HIDDEN
    Data nNivel     As Intger HIDDEN
    Data cReserv    As String HIDDEN
    Data cCheck     As String HIDDEN
    Data cTriger    As String HIDDEN
    Data cPropri    As String HIDDEN
    Data cBrowse    As String HIDDEN
    Data cVisual    As String HIDDEN
    Data cContext   As String HIDDEN
    Data cObrigat   As String HIDDEN
    Data cVldUser   As String HIDDEN
    Data cBox       As String HIDDEN
    Data cPictVar   As String HIDDEN
    Data cWhen      As String HIDDEN
    Data cIniBrw    As String HIDDEN
    Data cGrpSXG    As String HIDDEN
    Data cFolder    As String HIDDEN
    Data cPyme      As String HIDDEN
    
    //Métodos classe
    Method New()
    Method Ini()
    Method Add()
    Method ASX3(Value)
    Method Campo(Value)
    Method Tipo(Value)    
    Method Tit(Value)        
    Method Vld(Value)
    Method Usa(Value)
    Method Rlc(Value)
    Method F3(Value)
    Method Nvl(Value)
    Method Rsv(Value)
    Method Chk(Value)
    Method Trg(Value)
    Method Prop(Value)
    Method Brw(Value)
    Method Vsu(Value)
    Method Cntx(Value)
    Method Obr(Value)
    Method VlUser(Value)
    Method Box(Value)
    Method PicVar(Value)
    Method When(Value)
    Method IniBrw(Value)
    Method GRP(Value)
    Method Fld(Value)
    Method Pyme(Value)
    Method SX3(Value)
    Method Hlp(Value)
    
ENDCLASS


//-------------------------------------------------------------------
/*/{Protheus.doc}Método New da Classe


@author Erick G. /Dias
@since 18/02/2015
@version 11.80
/*/
//-------------------------------------------------------------------
METHOD New() Class UPDGEN
    
    Self:Ini()
    
Return Self

//-------------------------------------------------------------------
/*/{Protheus.doc} Ini()

Método que irá iniciar todas as propriedades da classe para uma nova inclusão.

@author Erick G. /Dias
@since 18/02/2015
@version 11.80
/*/
//-------------------------------------------------------------------
METHOD Ini() Class UPDGEN
    
    Self:cTabela    := ''
    Self:cOrdem     := ''
    Self:cCampo     := ''
    Self:cTipo      := ''
    Self:nTamanho   := 0
    Self:nDecimal   := 0
    Self:cTitulo    := ''
    Self:cDescr     := ''
    Self:cPicture   := ''
    Self:cValid     := ''
    Self:cUsado     := X3_USADO_EMUSO
    Self:cRelac     := ''
    Self:cF3        := ''
    Self:nNivel     := 1
    Self:cReserv    := X3_RESER
    Self:cCheck     := ''
    Self:cTriger    := ''
    Self:cPropri    := 'S'
    Self:cBrowse    := 'S'
    Self:cVisual    := 'A'
    Self:cContext   := 'R'
    Self:cObrigat   := ''
    Self:cVldUser   := ''
    Self:cBox       := ''
    Self:cPictVar   := ''
    Self:cWhen      := ''
    Self:cIniBrw    := ''
    Self:cGrpSXG    := ''
    Self:cFolder    := ''
    Self:cPyme      := 'S'
    
Return

Method Campo(cTab,cCmp,cOrd) Class UPDGEN
	DEFAULT cOrd	:= ''
    Self:cTabela    := cTab
    Self:cCampo     := cCmp
    Self:cOrdem     := cOrd
Return

Method Tipo(cTipo, nTam, nDec, cPic) Class UPDGEN
    Self:cTipo      := cTipo
    Self:nTamanho   := nTam
    Self:nDecimal   := nDec
    Self:cPicture   := cPic
Return

Method Tit(cTitulo, cDescr) Class UPDGEN
    Self:cTitulo    := cTitulo
    Self:cDescr     := cDescr
Return

Method Vld(Value) Class UPDGEN
    Self:cValid     := Value
Return

Method Usa(Value) Class UPDGEN
    Self:cUsado     := Value
Return

Method Rlc(Value) Class UPDGEN
    Self:cRelac     := Value
Return

Method F3(Value) Class UPDGEN
    Self:cF3        := Value
Return

Method Nvl(Value) Class UPDGEN
    Self:nNivel     := Value
Return

Method Rsv(Value) Class UPDGEN
    Self:cReserv    := Value
Return

Method Chk(Value) Class UPDGEN
    Self:cCheck     := Value
Return

Method Trg(Value) Class UPDGEN
    Self:cTriger    := Value
Return

Method Prop(Value) Class UPDGEN
    Self:cPropri    := Value
Return

Method Brw(Value) Class UPDGEN
    Self:cBrowse    := Value
Return

Method Vsu(Value) Class UPDGEN
    Self:cVisual    := Value
Return

Method Cntx(Value) Class UPDGEN
    Self:cContext   := Value
Return

Method Obr(Value) Class UPDGEN
    Self:cObrigat   := Value
Return

Method VlUser(Value) Class UPDGEN
    Self:cVldUser   := Value
Return

Method Box(Value) Class UPDGEN
    Self:cBox       := Value
Return

Method PicVar(Value) Class UPDGEN
    Self:cPictVar   := Value
Return

Method When(Value) Class UPDGEN
    Self:cWhen      := Value
Return

Method IniBrw(Value) Class UPDGEN
    Self:cIniBrw    := Value
Return

Method GRP(Value) Class UPDGEN
    Self:cGrpSXG    := Value
Return

Method Fld(Value) Class UPDGEN
    Self:cFolder    := Value
Return

Method Pyme(Value) Class UPDGEN
    Self:cPyme      := Value
Return

Method SX3(Value) Class UPDGEN
    Self:aSX3       := Value
Return

Method Hlp(Value) Class UPDGEN
    PutHelp('P'+Self:cCampo,Value,Value,Value,.T.)
    Self:Add()
Return

//-------------------------------------------------------------------
/*/{Protheus.doc} Add()

Método que adiciona novo item no array da SX3.

@author 
@since 
@version 
/*/
//-------------------------------------------------------------------
METHOD Add() Class UPDGEN
    
    AADD(Self:aSX3,{;
    Self:cTabela,;    //01-X3_ARQUIVO
    Self:cOrdem,;     //02-X3_ORDEM
    Self:cCampo,;     //03-X3_CAMPO
    Self:cTipo,;      //04-X3_TIPO
    Self:nTamanho,;   //05-X3_TAMANHO
    Self:nDecimal,;   //06-X3_DECIMAL
    Self:cTitulo,;    //07-X3_TITULO
    Self:cTitulo,;    //08-X3_TITSPA
    Self:cTitulo,;    //09-X3_TITENG
    Self:cDescr,;     //10-X3_DESCRIC
    Self:cDescr,;     //11-X3_DESCSPA
    Self:cDescr,;     //12-X3_DESCENG
    Self:cPicture,;   //13-X3_PICTURE
    Self:cValid,;     //14-X3_VALID
    Self:cUsado,;     //15-X3_USADO
    Self:cRelac,;     //16-X3_RELACAO
    Self:cF3,;        //17-X3_F3
    Self:nNivel,;     //18-X3_NIVEL
    Self:cReserv,;    //19-X3_RESERV
    Self:cCheck,;     //20-X3_CHECK
    Self:cTriger,;    //21-X3_TRIGGER
    Self:cPropri,;    //22-X3_PROPRI
    Self:cBrowse,;    //23-X3_BROWSE
    Self:cVisual,;    //24-X3_VISUAL
    Self:cContext,;   //25-X3_CONTEXT
    Self:cObrigat,;   //26-X3_OBRIGAT
    Self:cVldUser,;   //27-X3_VLDUSER
    Self:cBox,;       //28-X3_CBOX
    Self:cBox,;       //29-X3_CBOXSPA
    Self:cBox,;       //30-X3_CBOXENG
    Self:cPictVar,;   //31-X3_PICTVAR
    Self:cWhen,;      //32-X3_WHEN
    Self:cIniBrw,;    //33-X3_INIBRW
    Self:cGrpSXG,;    //34-X3_GRPSXG
    Self:cFolder,;    //35-X3_FOLDER
    Self:cPyme})      //36-X3_PYME
    Self:Ini()
    
Return

 /*/{Protheus.doc} nomeFunction
    (long_description)
    @type  Function
    @author user
    @since 09/05/2024
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
user Function criatab()
//Não tem conexão com banco de dados
//Não usou dbaccess
Local cTab := "Z01"

PREPARE ENVIRONMENT EMPRESA "T1" FILIAL "XIFIS26" MODULO "FIS" TABLES "SF1","SD1","SA1","SA2","SB1","SB2","SF4"

    dbSelecTArea(cTab)
    dbCloseArea(cTab)
    
RESET ENVIRONMENT

Return 

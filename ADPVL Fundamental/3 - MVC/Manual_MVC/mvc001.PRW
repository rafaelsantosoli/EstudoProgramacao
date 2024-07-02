#INCLUDE "PROTHEUS.CH"
#INCLUDE "FWMBROWSE.CH"
#INCLUDE "FWMVCDEF.CH"

//-------------------------------------------------------------------
/*/{Protheus.doc} MVC001

@author Rafael dos Santos
@version 1.0

/*/
//-------------------------------------------------------------------
user Function MVC001()

	Local   oBrowse

	IF  AliasIndic("Z01") 
		oBrowse := FWMBrowse():New()
		oBrowse:SetAlias("Z01")
		oBrowse:SetDescription("Z01") //Tabela de Inscrição Estadual
		oBrowse:Activate()	
	EndIf
	
Return

//-------------------------------------------------------------------
/*/{Protheus.doc}MenuDef                                     
Funcao generica MVC com as opcoes de menu

@author Rafael dos Santos
@version 1.0

/*/
//-------------------------------------------------------------------                                                                                            

Static Function MenuDef()

	Local aRotina := {}
	
ADD OPTION aRotina TITLE 'Visualizar' ACTION 'VIEWDEF.MVC001' OPERATION 2 ACCESS 0
ADD OPTION aRotina TITLE 'Incluir'    ACTION 'VIEWDEF.MVC001' OPERATION 3 ACCESS 0
ADD OPTION aRotina TITLE 'Alterar'    ACTION 'VIEWDEF.MVC001' OPERATION 4 ACCESS 0
ADD OPTION aRotina TITLE 'Excluir'    ACTION 'VIEWDEF.MVC001' OPERATION 5 ACCESS 0
ADD OPTION aRotina TITLE 'Imprimir'   ACTION 'VIEWDEF.MVC001' OPERATION 8 ACCESS 0
ADD OPTION aRotina TITLE 'Copiar'     ACTION 'VIEWDEF.MVC001' OPERATION 9 ACCESS 0
		
Return aRotina

//-------------------------------------------------------------------
/*/{Protheus.doc}  ModelDef
Funcao generica MVC do model

@author Rafael dos Santos
@version 1.0

/*/
//-------------------------------------------------------------------

Static Function ModelDef()

	Local oModel
	Local oStructCAB := FWFormStruct(1,"Z01")    
	
	oModel	:=	MPFormModel():New('MVC001MOD')
	
	oModel:AddFields('MVC001MOD',,oStructCAB)
	
Return oModel 

//-------------------------------------------------------------------
/*/{Protheus.doc} ViewDef
Funcao generica MVC do View

@author Rafael dos Santos
@version 1.0

/*/
//-------------------------------------------------------------------
Static Function ViewDef()

	Local oView      := FWFormView():New()
	Local oModel     := FWLoadModel("MVC001")
	Local oStructCAB := FWFormStruct(2,"Z01")	

	oView:SetModel(oModel)

	oView:AddField("VIEW_CAB",oStructCAB,'MVC001MOD')	

	oView:CreateHorizontalBox("CABEC",100)

	oView:SetOwnerView("VIEW_CAB","CABEC")	
	
Return oView

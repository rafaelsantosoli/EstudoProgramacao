#INCLUDE "PROTHEUS.CH"
#Include "topconn.ch" 

/*User Function Varpam()

Local cVar1 := "Brasil"
    
U_filha()

CONOUT(cVar1)

Return


User Function filha()

Local cVar1 := "São Paulo"

Return */

//Resposta: Brasil


//////////////////////////////////////////////////////////////////////////////////////////////////////


/*
STATIC cVar1 := "Brasil"

User Function Varpam()

Static cVar1 := "Bahia"
    
U_filha()

CONOUT(cVar1)

Return

User Function filha()

Static cVar1 := "São Paulo"

Return
*/

//Resposta: São Paulo

//////////////////////////////////////////////////////////////////////////////////////////////////////

/*
STATIC cVar1 := "Brasil"

User Function Varpam()

Local cVar1 := "Bahia"
    
U_filha()

CONOUT(cVar1)

Return

User Function filha()

Local cVar1 := "São Paulo"

Return
*/

//Resposta: Bahia


//////////////////////////////////////////////////////////////////////////////////////////////////////

/*
STATIC cVar1 := "Brasil"

User Function Varpam()   
    
U_filha()

CONOUT(cVar1)

Return

User Function filha()

cVar1 := "São Paulo"

Return

*/

//Resposta: São Paulo

//////////////////////////////////////////////////////////////////////////////////////////////////////

/*
User Function Varpam()

Private cVar1 := "Brasil"
    
U_filha()

CONOUT(cVar1)

Return

User Function filha()

Private cVar1 := "São Paulo"

Return

*/

//Resposta: Brasil

//////////////////////////////////////////////////////////////////////////////////////////////////////

/*
User Function Varpam()

Private cVar1 := "Brasil"
    
U_filha()

CONOUT(cVar1)

Return

User Function filha()

cVar1 := "São Paulo"

Return

*/

//Resposta: São Paulo

//////////////////////////////////////////////////////////////////////////////////////////////////////

/*
User Function Varpam()

cVar1 := "Brasil"
    
U_filha()

CONOUT(cVar1)

Return

User Function filha()

cVar1 := "São Paulo"

Return

*/

//Resposta: São Paulo

//////////////////////////////////////////////////////////////////////////////////////////////////////

/*
User Function Varpam()

Public cVar1 := "Brasil"
    
U_filha()

CONOUT(cVar1)

Return

User Function filha()

Private cVar1 := "São Paulo"

Return

*/

//Resposta: Brasil


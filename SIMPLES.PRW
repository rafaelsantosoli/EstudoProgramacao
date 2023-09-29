#Include "PROTHEUS.CH"  


User Function simples()
Local idade := 18

    if idade > 16
        MSGINFO ( "Voce é maior de idade")   
    ENDIF

Return


User Function composto()
Local idade := 15
    
    if idade > 16 
        MSGINFO ( "Voce é maior de idade")
    else 
        MSGINFO ( "Voce é menor de idade")
    ENDIF
Return


User Function encade()  //funcao com 10 posicoes em advpl e tlpp sem limite de posicoes
Local idade := 15

    if idade = 15
        MSGINFO ("Você é debutante")
    elseif idade > 15
        MSGINFO ("Você é maior de idade")
    else
         MSGINFO ("Você é menor de idade")
    endif

Return


User Function multipla()
Local idade:= 65

Do CASE
    Case idade = 15 
        MSGINFO ("Voce é debutante!")
    Case idade > 15 .and. idade < 15
        MSGINFO ("Voce é maior de idade")
    Case idade < 15
        MSGINFO ("Voce é menor de idade")
    case idade >= 65
        MSGINFO ("Voce é idoso")
End CASE
    
Return

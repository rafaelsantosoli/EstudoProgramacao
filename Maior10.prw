#INCLUDE 'protheus.ch'

User Function Maior10()
Local nGuess 
Local nCorrectNumber := 10


nGuess = Val(FWInputBox('Digite um número',''))
    IF(nGuess <= nCorrectNumber )
        Alert('Número abaixo ou igual a: ' + cValToChar(nCorrectNumber) )
        
    ELSE 
        Alert('Número acima de:  '  + cValToChar(nCorrectNumber) ) 
        
    ENDIF
    



       
RETURN

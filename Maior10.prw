#INCLUDE 'protheus.ch'

User Function Maior10()
Local nGuess 
Local nCorrectNumber := 10


nGuess = Val(FWInputBox('Digite um n�mero',''))
    IF(nGuess <= nCorrectNumber )
        Alert('N�mero abaixo ou igual a: ' + cValToChar(nCorrectNumber) )
        
    ELSE 
        Alert('N�mero acima de:  '  + cValToChar(nCorrectNumber) ) 
        
    ENDIF
    



       
RETURN

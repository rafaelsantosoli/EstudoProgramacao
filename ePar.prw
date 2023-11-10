#INCLUDE 'protheus.ch'

User Function ePar()
Local nNumber

nNumber = Val(FWInputBox('Digite um número',''))
    IF(nNumber % 2 == 0  )
        Alert('Número ' + cValToChar(nNumber) + ' é PAR'  )
    ELSE 
         Alert('Número ' + cValToChar(nNumber) + ' é IMPAR'  )

    ENDIF
    


       
RETURN 

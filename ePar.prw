#INCLUDE 'protheus.ch'

User Function ePar()
Local nNumber

nNumber = Val(FWInputBox('Digite um n�mero',''))
    IF(nNumber % 2 == 0  )
        Alert('N�mero ' + cValToChar(nNumber) + ' � PAR'  )
    ELSE 
         Alert('N�mero ' + cValToChar(nNumber) + ' � IMPAR'  )

    ENDIF
    


       
RETURN 

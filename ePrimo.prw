#INCLUDE 'protheus.ch'

User Function ePrimo()
Local nNumber

nNumber = Val(FWInputBox('Digite um n�mero',''))
 IF(nNumber > 0 )
        IF(nNumber % 2 == 0  )
            Alert('N�mero ' + cValToChar(nNumber) + ' � PAR'  )
        ELSE 
                        IF(nNumber / nNumber == 0  )
                            Alert('N�mero ' + cValToChar(nNumber) + ' � IMPAR e PRIMO'  )
                        ELSE 
                            Alert('N�mero ' + cValToChar(nNumber) + ' � IMPAR'  )

                        ENDIF

        ENDIF
ELSE 
         Alert('N�mero ' + cValToChar(nNumber) + ' � NEGATIVO'  )

ENDIF
RETURN

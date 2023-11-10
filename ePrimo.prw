#INCLUDE 'protheus.ch'

User Function ePrimo()
Local nNumber

nNumber = Val(FWInputBox('Digite um número',''))
 IF(nNumber > 0 )
        IF(nNumber % 2 == 0  )
            Alert('Número ' + cValToChar(nNumber) + ' é PAR'  )
        ELSE 
                        IF(nNumber / nNumber == 0  )
                            Alert('Número ' + cValToChar(nNumber) + ' é IMPAR e PRIMO'  )
                        ELSE 
                            Alert('Número ' + cValToChar(nNumber) + ' é IMPAR'  )

                        ENDIF

        ENDIF
ELSE 
         Alert('Número ' + cValToChar(nNumber) + ' é NEGATIVO'  )

ENDIF
RETURN

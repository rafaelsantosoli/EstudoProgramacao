#INCLUDE 'protheus.ch'

User Function AdcTexto()
Local cText := 'Eu gosto de '
Local nGuess

nGuess = (FWInputBox('Digite seu prato favorito',''))
    msgAlert(CVALTOCHAR ( cText ) +' '+ CVALTOCHAR( nGuess ))
    
RETURN

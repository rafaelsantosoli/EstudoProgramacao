#INCLUDE 'protheus.ch'


user Function c(x)
    DO CASE
     case x == 'simples'
    U_simples()
     case x == 'composto'
    U_composto()
     case x == 'encad'
    U_composto()
     case x == 'multipla'
    U_multipla()
    ENDCASE


Return

user Function simples()
Local nAge := 20

if nAge > 18
     alert( 'Voc� � maior de idade' )
endif
   
Return 

user Function composto()

Local nAge := 16
    if nAge > 18
        alert('Voc� � maior de idade')
    else
        alert('Voc� � menor de idade')
    endif
Return 

user Function encad()
    Local nAge := 22

    if nAge > 18 .and. nAge <> 22
        alert('Voc� � maior de idade')
    elseif nAge == 22
        alert('Voc� tem 22 anos')
    else
        alert('Voc� � menor de idade')    
    endif
        

Return 

    user Function multipla()
    Local nAge := 18
    

    Do Case
        case nAge = 0 && <=10
            alert('Voc� tem entre 1 e 10 anos ')
        case nAge > 10 && <=20
            alert('Voc� tem entre 11 e 20 anos')
        case nAge > 20 && <=30
            alert('Voc� tem entre 21 e 30 anos')
        OTHERWISE
         alert('Voc� tem mais que 30 anos')
    ENDCASE


Return 


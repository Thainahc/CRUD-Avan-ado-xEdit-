#INCLUDE "WINUSER.CH"

*------------------*
 FUNCTION CONSULTAR()

 LOCAL GetList:={}, cNome:=Space(50), cOrdem_Produtos:="", nRegistro_Produtos:=0

 @ 12,10 CLEAR TO 15,67

 @ 12,12 TO 15,67
 @ 13,14 SAY "INFORME O NOME DO PRODUTO: "
 @ 14,14 GET cNome

 READ

 cOrdem_Produtos   :=PRODUTOS->(OrdSetFocus("NOME"))
 nRegistro_Produtos:=PRODUTOS->(RecNo())

 IF !PRODUTOS->(DBSeek(AllTrim(cNome)))
    PRODUTOS->(DBGoTo(nRegistro_Produtos))
    MessageBox(,"O produto não foi encontrado.","Atenção",MB_ICONWARNING)
 ENDIF

 PRODUTOS->(OrdSetFocus(cOrdem_Produtos))

 RETURN NIL
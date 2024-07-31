#INCLUDE "WINUSER.CH"

*-----------------*
 FUNCTION INCLUIR()

 LOCAL GetList:={}, nCodigo:=0, cNome:=Space(50), nPreco:=0, dData:=Date(), cInativo:=Space(1)

 @ 03,00 CLEAR TO 22,80

 @ 03,00 SAY PadC("INCLUSAO", 80)
 @ 04,00 SAY Replicate("-", 80)
 @ 05,01 SAY "CODIGO:    " GET nCodigo  PICTURE "99999"  VALID nCodigo>0 .AND. !CODIGO_EXISTE(nCodigo)
 @ 06,01 SAY "NOME:      " GET cNome    PICTURE "@!S30"  VALID !Empty(cNome)
 @ 07,01 SAY "PRECO (R$):" GET nPreco   PICTURE "999.99" VALID nPreco>0
 @ 08,01 SAY "DATA:      " GET dData                     VALID dData>=Date()
 @ 09,01 SAY "INATIVO:   " GET cInativo PICTURE "@!"     VALID (cInativo$"SN")

 READ

 IF LastKey()==27
    RETURN NIL
 ENDIF

 SELECT PRODUTOS
 DBAppend()
 REPLACE CODIGO  WITH nCodigo
 REPLACE NOME    WITH cNome
 REPLACE PRECO   WITH nPreco
 REPLACE DATA    WITH dData
 REPLACE INATIVO WITH cInativo=="S"
 DBCommit()

 RETURN NIL

*------------------------------*
 FUNCTION CODIGO_EXISTE(nCodigo)

 LOCAL lRetorno:=.F., cOrdem:="", nRegistro:=0

 cOrdem   :=PRODUTOS->(OrdSetFocus("CODIGO"))
 nRegistro:=PRODUTOS->(RecNo())
 lRetorno :=PRODUTOS->(DBSeek(nCodigo))

 IF lRetorno
    MessageBox(,"O c�digo informado j� existe.","Aten��o",MB_ICONWARNING)
 ENDIF

 PRODUTOS->(OrdSetFocus(cOrdem))
 PRODUTOS->(DBGoTo(nRegistro))

 RETURN lRetorno
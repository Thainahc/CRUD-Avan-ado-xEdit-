#INCLUDE "WINUSER.CH"

*-----------------*
 FUNCTION EXCLUIR()

 IF MessageBox(,"Deseja realmente excluir o produto?","Aten��o",MB_ICONQUESTION+MB_YESNO)==IDNO
    RETURN NIL
 ENDIF

 SELECT PRODUTOS
 RLock()
 DELETE
 DBUnlock()

 RETURN NIL
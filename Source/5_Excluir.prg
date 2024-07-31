#INCLUDE "WINUSER.CH"

*-----------------*
 FUNCTION EXCLUIR()

 IF PRODUTOS->CODIGO==0
    MessageBox(,"O arquivo está vazio.","Atenção",MB_ICONWARNING)
    RETURN NIL
 ENDIF

 IF MessageBox(,"Deseja realmente excluir o produto?","Atenção",MB_ICONQUESTION+MB_YESNO)==IDNO
    RETURN NIL
 ENDIF

 SELECT PRODUTOS
 RLock()
 DELETE
 DBUnlock()

 RETURN NIL
#INCLUDE "WINUSER.CH"

*-----------------*
 FUNCTION ALTERAR()

 LOCAL GetList:={}, nCodigo:=0, cNome:="", nPreco:=0, dCadastro:=CToD(''), cInativo:=""

 IF PRODUTOS->CODIGO==0
    MessageBox(,"O arquivo está vazio.","Atenção",MB_ICONWARNING)
    RETURN NIL
 ENDIF

 nCodigo  :=PRODUTOS->CODIGO
 cNome    :=PRODUTOS->NOME
 nPreco   :=PRODUTOS->PRECO
 dCadastro:=PRODUTOS->CADASTRO
 cInativo :=IIF(PRODUTOS->INATIVO,"S","N")

 @ 03,00 CLEAR TO 22,80

 @ 04,00 SAY PadC("ALTERACAO", 80)
 @ 05,00 SAY Replicate("-", 80)
 @ 06,01 SAY "CODIGO:    " GET nCodigo   PICTURE "99999"  WHEN .F. VALID nCodigo>0
 @ 07,01 SAY "NOME:      " GET cNome     PICTURE "@!S30"           VALID !Empty(cNome)
 @ 08,01 SAY "PRECO (R$):" GET nPreco    PICTURE "999.99"          VALID nPreco>0
 @ 09,01 SAY "CADASTRO:  " GET dCadastro                           VALID dCadastro>=Date()
 @ 10,01 SAY "INATIVO:   " GET cInativo  PICTURE "@!"              VALID (cInativo$"SN")

 READ

 IF LastKey()==27
    RETURN NIL
 ENDIF

 SELECT PRODUTOS
 RLock()
 REPLACE NOME     WITH cNome
 REPLACE PRECO    WITH nPreco
 REPLACE CADASTRO WITH dCadastro
 REPLACE INATIVO  WITH cInativo=="S"
 DBCommit()
 DBUnlock()

 RETURN NIL
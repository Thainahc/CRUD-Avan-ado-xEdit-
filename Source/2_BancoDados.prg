*----------------------------*
 FUNCTION INICIA_BANCO_DADOS()

 IF !IsDirectory("DBF")
    Run("MD DBF")
 ENDIF

 IF !IsDirectory("NTX")
    Run("MD NTX")
 ENDIF

 IF !File("DBF\PRODUTOS.DBF")
    DBCreate("DBF\PRODUTOS.DBF", {{"CODIGO" ,"N",05,0},;
                                  {"NOME"   ,"C",50,0},;
                                  {"PRECO"  ,"N",06,2},;
                                  {"DATA"   ,"D",08,0},;
                                  {"INATIVO","L",01,0}})
 ENDIF

 SELECT 0
 USE DBF\PRODUTOS
 INDEX ON PRODUTOS->CODIGO TAG "CODIGO" TO NTX\IND_PRODUTOS
 INDEX ON PRODUTOS->NOME   TAG "NOME"   TO NTX\IND_PRODUTOS

 RETURN NIL

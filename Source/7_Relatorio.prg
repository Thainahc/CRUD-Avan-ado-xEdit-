#INCLUDE "WINUSER.CH"

*----------------------*
 FUNCTION IMPRIMIR()

 LOCAL nArquivo, cCRLF:=Chr(13)+Chr(10), nRegistro_Produtos:=0

 nArquivo:=FCreate("Relatório.txt")

 FWrite(nArquivo,PadC("RELATÓRIO DE PRODUTOS", 80)+cCRLF)
 FWrite(nArquivo,Replicate("-", 80)+cCRLF)

 FWrite(nArquivo,"CÓDIGO | NOME"+ SPACE(47)+ "|"+ PadL("PRECO", 19)+cCRLF)
 FWrite(nArquivo,Replicate("-", 80)+cCRLF)

 SELECT PRODUTOS
 nRegistro_Produtos:=RecNo()

 DBGoTop()

 DO WHILE !Eof()
    FWrite(nArquivo,Str(PRODUTOS->CODIGO,6)+" | "+PRODUTOS->NOME+" | "+PadL(Str(PRODUTOS->PRECO,6,2),18)+cCRLF)
    DBSkip()
 ENDDO

 DBGoTo(nRegistro_Produtos)
 FClose(nArquivo)

 MessageBox(,"Relatório.txt gerado com sucesso!","Relatório",MB_ICONINFORMATION)

 RETURN NIL
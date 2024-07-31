<p align="center">
    <a href="#banco-de-dados">Banco de dados</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="#tela-inicial">Tela inicial</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
    <a href="#funcionalidades">Funcionalidades</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
</p>
Crie um sistema que simule um cadastro de produtos.

## Banco de dados
Os produtos ficarão em uma tabela DBF, com os campos:

| Campo    | Tipo      | Tamanho |
| -------- | --------- | ------- |
| CODIGO   | Número    |       5 |
| NOME     | Caractere |      50 |
| PRECO    | Número    |     6,2 |
| CADASTRO | Data      |       8 |
| INATIVO  | Lógico    |       1 |

## Tela inicial
A tela inicial será uma lista de produtos por **ordem alfabética**, com as colunas: CODIGO, NOME e PRECO.

> Fique a vontade se quiser exibir todas as colunas.

A tela inicial terá as seguintes funcionalidades:

- INCLUIR (INS):
- ALTERAR (ENTER)
- EXCLUIR (DEL)
- BUSCAR (LETRA): 
- RELATORIO (F2)

## Funcionalidades

### Incluir

Abre uma nova tela, com os campos:

| Campo    | Valor padrão (exibido ao abrir a tela)  | Valores válidos                                           |
| -------- | --------------------------------------- | --------------------------------------------------------- |
| CODIGO   | 0                                       | Código maior que zero, e que não exista em outro produto. |
| NOME     |                                         | Nome não pode ser vazio.                                  |
| PRECO    | 0.00                                    | Preço maior que zero.                                     |
| CADASTRO | Data atual                              | Data maior ou igual à data atual.                         |
| INATIVO  | N                                       | S ou N                                                    |

> Use PICTURE para colocar máscara nos campos. Por exemplo, os campos NOME e INATIVO só podem ter letra maiúscula.

- Ao finalizar a inclusão dos dados, as informações serão salvas no banco de dados, e o sistema exibirá a tela principal (atualizada).
- Ao apertar ESC, o sistema deve voltar para a tela principal, sem salvar nada no banco de dados.

### Alterar

> Não pode ser acessada, se a lista estiver vazia.

Abre uma nova tela, com os campos **preenchidos**:

| Campo    | Valores válidos                   | Observação                                                    |
| -------- | --------------------------------- | ------------------------------------------------------------- |
| CODIGO   |                                   | Esse campo não pode ser alterado, é apenas para visualização. |
| NOME     | Nome não pode ser vazio.          |                                                               |
| PRECO    | Preço maior que zero.             |                                                               |
| CADASTRO | Data maior ou igual à data atual. |                                                               |        
| INATIVO  | S ou N                            |                                                               |

> Use PICTURE para colocar máscara nos campos. Por exemplo, os campos NOME e INATIVO só podem ter letra maiúscula.

- Ao finalizar a alteração dos dados, as informações serão salvas no banco de dados (com exceção do código, que não pode ser alterado), e o sistema exibirá a tela principal (atualizada). 
- Ao apertar ESC, o sistema deve voltar para a tela principal, sem salvar nada no banco de dados.

### Excluir

> Não pode ser acessada, se a lista estiver vazia.

Perguntar se o usuário realmente deseja excluir o produto. Se sim, deletar o produto na tabela DBF.

O produto excluído não pode mais ser exibido na tela principal.

### Consultar

> Não pode ser acessada, se a lista estiver vazia.

Essa funcionalidade deve ser ativada ao pressionar qualquer letra ou número do teclado. Ela exibirá uma tela com um campo, onde o usuário informará o nome do produto a ser buscado.
Se o nome for encontrado, o sistema deve exibir o produto na lista. Senão, o sistema deve exibir uma mensagem, dizendo que o produto não foi encontrado, e deve se manter no produto que estava antes de abrir a tela.

### Relatório

> Não pode ser acessada, se a lista estiver vazia.

Gera um "Relatório.txt", com todos os dados de todos os produtos.
Ao final da geração, informe ao usuário que o relatório foi gerado com sucesso.

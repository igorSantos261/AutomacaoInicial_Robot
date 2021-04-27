***Settings***
Resource         ../Resourcer/Resoucer.robot   
Test Setup        Abrir Navegador
#Test TearDown     Fechar Navegador
Documentation     teste abrir nav


###Setup ele executa keyword antes das suites ou antes dos testes
###TEARDOWN ele executa keyword depois de uma suite ou teste

#***Variable***




***Test Case***

Caso de Teste 01:Pesquisar Produto Existente
	[Tags]  01    zack
	[Documentation]  meu teste abrir navegador
    Acessar a pagina home do site
    Digitar o nome do produto "Blouse" no campo de Pesquisa
    Clicar no botao Pesquisar
    Conferir se o produto "Blouse" foi listado no site  

Caso de Teste 02:Pesquisar Produto não existente
	[tags]  02    zack
    Acessar a pagina home do site
    Digitar o nome do produto "ItemNaoExistente" no campo de Pesquisa
    Clicar no botao Pesquisar
    Conferir mensagem de erro "No results were found for your search "ItemNaoExistente""

Caso de Teste 03:Listar Produtos
	[tags]  03    zack
    Acessar a pagina home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Clicar na sub categoria "Summer Dresses"

Caso de Teste 04:Adicionar Produtos no Carrinho
    [tags]  04    zack
    Acessar a pagina home do site
    Digitar o nome de produto "t-shirt" no campo de pesquisa
    Clicar no botão de pesquisa
    Clicar no botão "Add to cart" do produto
    Clicar no botão "Proceed to checkout" 



Caso de Teste 05:Remover Produtos
    [tags]  05    zack
    Acessar a pagina home do site
    Clicar no ícone carrinho de compras no menu superior direito
    Clicar no botão de remoção de produtos (delete) no produto do carrinho

Caso de Teste 06:Adicionar Cliente

    Acessar a pagina home do site
    Clicar no botão superior direito “Sign in”
    Inserir um e-mail válido
    Clicar no botão "Create na account"
    Preencher os campos obrigatórios
    Clicar em "Register"para finalizar o cadastro

    

#***Keywords*** 
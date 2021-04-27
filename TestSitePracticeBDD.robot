***Settings**
Resource            ../Resourcer/Resoucer.robot   
Test Setup          Abrir Navegador
Test TearDown       Fechar Navegador




***Variable***
${URL}         http://automationpractice.com/
${Browser}     chrome


***Test Case***

Cenario 01:Pesquisar Produto Existente
    Dado que estou na pagina home do site
    Quando eu pesquisar pelo produto "Blouse"
    Entao o produto "Blouse" deve ser listado na pagina de resultado da busca
     

Cenario 02:Pesquisar Produto não existente
    Dado que estou na pagina home do site
    Quando eu pesquisar pelo produto "ItemNaoExistente" 
    Entao a pagina deve exibir a mensagem "No results were found for your search "ItemNaoExistente""
    
***Keywords***

Dado que estou na pagina home do site

    Acessar a pagina home do site
    
Quando eu pesquisar pelo produto "${PRODUTO}"

    Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa
    Clicar no botao Pesquisar


Entao o produto "${PRODUTO}" deve ser listado na pagina de resultado da busca  

    Conferir se o produto ${PRODUTO} foi listado no site


Entao a pagina deve exibir a mensagem "${MENSAGEM_ALERT}"

    Conferir mensagem de erro "${MENSAGEM_ALERT}"
    
*** Settings ***
Library          SeleniumLibrary
#Library         ExtendedSelenium2Library

#ScreenCapLibrary Start Video Recording  name=${filename}


***Variable***
${Browser}           chrome
${URL}               http://automationpractice.com/index.php
${EMAIL}             ts@teste.com.br
${FIST_NAME}           Isantos
${LAST_NAME}           AUTO
${CADASTRA_PASSWORD}   Teste@12345
${ENDERECO_1}          Av. Teste
${CITY}                Recife
${POSTAL_CODE}         52221
${PHONE_MOBILE}        5581999999999
${ENDERECO_ALTERNATIVO}   Rua dos Testes

***Keywords***

##Setup e Teardow

Abrir Navegador
    
	[Documentation]  abrindo navegador com Selenium
	Open Browser          about:blank    ${Browser} 
	Maximize Browser Window    

Fechar Navegador

     Close Browser
     
     
##Passo a Passo

Acessar a pagina home do site
     Go To                http://automationpractice.com/index.php
     Title Should Be      My Store
     
     
     
Digitar o nome do produto "${PRODUTO}" no campo de Pesquisa 

 	Input Text                     name=search_query             ${PRODUTO}
   
 	
Clicar no botao Pesquisar
 
 	Click Element                  name=submit_search
     
     
 	
Conferir se o produto ${PRODUTO} foi listado no site 	
    Wait until Element is Visible        css=#center_column > h1     
    Title Should Be                      Search - My Store
    Page Should Contain Image            xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link             xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),${PRODUTO})]



Conferir mensagem de erro "${MENSAGEM_ALERT}"
    
    Wait until Element is Visible        //*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be               //*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERT}
    

Passar o mouse por cima da categoria "${ITEM}" no menu principal superior de categorias

    Mouse Over                            //*[@id="block_top_menu"]/ul/li[1]/a                 

Clicar na sub categoria "Summer Dresses"

    Click Element                         //*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a   


Digitar o nome de produto "${PRODUTO}" no campo de pesquisa

    Input Text                             name=search_query             ${PRODUTO}

Clicar no botão de pesquisa

    Click Element                           name=submit_search

Clicar no botão "${LINK_POST}" do produto

                                      
    Mouse Over                             //*[@id="center_column"]/ul/li/div/div[2]/h5   
    Wait Until Element Is Visible          //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span   10s
    Click Element                          //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span 
                                             
 
                                        
Clicar no botão "${CHECKOUT}"

    #Mouse Over                               //*[@id="layer_cart"]/div[1]/div[2]/div[4]
    #Wait Until Element Is Visible              //span[contains(text(),'Proceed to checkout')]           20s
    #Click Element                             //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span/text()
    Wait Until Element Is Visible              //span[contains(text(),'Proceed to checkout')]           20s
    Click Element                             //span[contains(text(),'Proceed to checkout')]


Clicar no ícone carrinho de compras no menu superior direito

    Click Element                //*[@id="header"]/div[3]/div/div/div[3]/div/a



Clicar no botão de remoção de produtos (delete) no produto do carrinho
    
    
    Wait until Element is Visible            //*[@id="center_column"]/p
    Element Text Should Be                  //*[@id="center_column"]/p[contains(@class,'alert alert-warning')]   ${MENSAGEM_ALERT_CARRINHO} 
    
    #//*[@id="center_column"]/p[@class='alert alert-warning']   
         

Clicar no botão superior direito “Sign in”

    Click Element                          //*[@id="header"]/div[2]/div/div/nav/div[1]/a     
    Unselect Frame
Inserir um e-mail válido
    
    #Wait until Element is Visible                 //*[@id="email_create"]        10s      
    Mouse Over                                   //*[@id="create-account_form"]/div/div[2]
    Wait until Element is Visible                name=email_create        10s
    Input Text                                   name=email_create                                     ${EMAIL}
    Unselect Frame
Clicar no botão "Create na account"

   Wait until Element is Visible                 //button[contains(@id,'SubmitCreate')]  10s
   Click Element                                 //button[contains(@id,'SubmitCreate')]
   Unselect Frame

Preencher os campos obrigatórios
    
    Wait until Element is Visible            //*[@id="id_gender1"]             10s
    Click Element                            //*[@id="id_gender1"]
    Input Text                               //*[@id="customer_firstname"]     ${FIST_NAME}
    Input Text                               //*[@id="customer_lastname"]      ${LAST_NAME}
    Input Text                               //*[@id="passwd"]                 ${CADASTRA_PASSWORD}
    Input Text                               //*[@id="address1"]               ${ENDERECO_1}
    Input Text                               //*[@id="city"]                   ${CITY}
    Mouse Over                               //*[@id="account-creation_form"]/div[2]/p[7]
    Wait Until Element Is Visible            //select[contains(@id,"id_state")]/option[4]
    Click Element                            //select[contains(@id,"id_state")]/option[4]  
    Input Text                               //*[@id="postcode"]                      ${POSTAL_CODE}
    Input Text                               //*[@id="phone_mobile"]                  ${PHONE_MOBILE}
    Input Text                               //*[@id="alias"]                         ${ENDERECO_ALTERNATIVO}

Clicar em "Register"para finalizar o cadastro

   Wait until Element is Visible                 //button[contains(@id,'submitAccount')]  10s
   Click Element                                 //button[contains(@id,'submitAccount')]
   
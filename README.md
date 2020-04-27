# Localiza Weather

## Sobre

O objetivo deste aplicativo é oferecer uma ajuda no planejamento da viagem aos clientes da maior empresa de aluguel de carros da América Latina. Sendo assim, o aplicativo permite a consulta da previsão do tempo da localização atual e do destino da viagem do cliente, com apenas um clique!

## Desenvolvimento 

O projeto foi desenvolvido na linguagem Swift 5+, com o Xcode 11.4.1.

Para build e deploy do projeto, é necessário que o desenvolvedor execute o processo de instalação dos frameworks utilizados no aplicativo via CocoaPods, através do comando:

``` sh
pod install
```
Para mais informações: https://cocoapods.org/

## Funcionalidades

* Permite consultar a previsão do tempo da localização atual
* Permite consultar a previsão do tempo do destino da viagem informada
* Permite visualizar mapa de origem e destino da viagem
* Permite visualizar a aplicação no modo dark/light mode


## Uso

1. O usuário inicia a aplicação;
2. O usuário poderá escolher utilizar o aplicativo no modo dark ou light mode;
3. O usuário deverá informar obrigatoriamente o nome e preferencialmente um destino;
4. O usuário inicia a consulta através do botão CONSULTAR;
5. O aplicativo iniciará uma nova consulta pela localização atual e destino informado;
6. Uma nova tela será exibida com as informaçoes atualizadas, além de um mapa exibindo a rota fornecida pelo usuário;
7. O aplicativo é capaz de atualizar automaticamente os dados de localização a cada 5 minutos.

Obs.: Para o funcionamento adequado, o usuário deverá permitir que o aplicativo faça uso da sua localizão atual. Em caso de simuladores, o desenvolvedor deverá estar atento às configurações e parametros de localização do simulador

## Frameworks

Foram utilizados os frameworks:

* Alamofire:
  * Framework utilizado para requisições HTTP
* RxSwift
  * Framework utilizado para atualização de elementos visuais de forma assíncrona
* Kingfisher
  * Framework utilizado para download e cache de imagens
* Quick e Nimble
  * Framework utilizado para suporte à teste unitários baseados em Behavior-Driven Testing

## Arquitetura e definições técnicas

Esta aplicação foi desenvolvida utilizando a arquitetura MVVM. Esta arquitetura visa estabelecer uma clara separação de responsabilidades através de estruturas como Model, View e ViewModel. Além disso, outras camadas e padrões de projetos foram adotados para complementar o design da aplicação.

Os elementos visuais, como componentes e telas foram desenvolvidos através de soluções de ViewCode, onde garante melhor performance, organização, manutenção e responsividade, para toda e qualquer resolução de dispositivos.

Os binds visuais, como por exemplo de telas e componentes para modo dark/light mode, foram criados utilizando RxSwift, de forma reativa e assíncrona.

Sobre outras soluções, camadas e estruturas:

* Network:
  * Camada responsável por implmentar os métodos da API de requisição HTTP
* Injector
  * Injeção de independência para gerenciamento e controle de localização atual
* Componentes
  * Elementos visuais como, cabeçalho, cards, mapa, botões e imagens
* Utils
  * Outros recursos necessários para melhor visualização e personalização
* Localizable
  * Garante a internacionalização da aplicação
* Assets
  * Centraliza os recurso gráficos utilizados, como imagens e icones
  
## Testes Unitários

O projeto contempla os testes unitários:

* Testes unitários da camada View
* Testes unitários da camada ViewModel
* Testes unitários da camada Network

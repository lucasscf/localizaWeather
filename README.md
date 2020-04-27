# Localiza Weather

## Sobre

O objetivo deste aplicativo é oferecer uma ajuda no planejamento da viagem aos clientes da maior empresa de aluguel de carros da América Latina. Sendo assim, o aplicativo permite a consulta da previsão do tempo da localização atual e do destino da viagem do cliente, com apenas um clique!

## Instalação 

Para executar o projeto, é necessário que o desenvolvedor execute o processo de instalação dos frameworks utilizados no aplicativo, através do comando:

``` sh
pod install
```
Para mais informações: https://cocoapods.org/

## Funcionalidades

* Permite consultar a previsão do tempo da localização atual
* Permite consultar a previsão do tempo do destino da viagem informada
* Permite visualizar mapa de origem e destino da viagem
* Permite visualizar a aplicação no modo dark/light mode

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

Esta aplicação foi desenvolvida utilizando a arquitetura MVVM. Arquitetura visa estabelecer uma clara separação de responsabilidades através de estruturas como Model, View e ViewModel. Além disso, outras camadas e padrões de projetos foram adotados para complementar o design da aplicação.

Os elementos visuais, como componentes e 

* Network:
  * Camada responsável por implmentar os métodos da API de requisição HTTP
* Injector
  * Injeção de independência para gerenciamento e controle de localização atual
* Componentes
  * Elementos visuais
* Quick e Nimble
  * Framework utilizado para suporte à teste unitários baseados em Behavior-Driven Testing

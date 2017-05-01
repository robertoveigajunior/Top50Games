Bibliotecas utilizadas:
=============

1. Alamofire
1. Kingfisher
 
Para utilizar as bibliotecas Alamofire e Kingfisher:
Faça o download dos repositórios no Github:
-------
```
https://github.com/Alamofire/Alamofire
https://github.com/onevcat/Kingfisher
```
_em seguida copie as pastas para dentro do seu projeto._
 
_ou através do_ **cocoapods**:
 
crie um arquivo Podfile contendo:
------- 
 Podfile:
 ```
  pod 'Alamofire', '~> 4.4'
  pod 'Kingfisher'
 ```
 
na pasta do projeto, execute o comando no terminal:
-------

Terminal:
```
pod install
```
_ps. Caso houver problemas tente:_
```
pod repo update
```
se ainda continuar o problema atualize o cocoapods:
```
sudo gem update -n /usr/local/bin cocoapods
```
por fim:
```
pod install
```

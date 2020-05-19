# TestEventSicredi
O app foi elaborado com a arquitetura MVVM-C(Model View ViewModel-Coordinators) como pode se ver em [Arquitetura](https://github.com/Crowlleey/TestEventSicredi/blob/master/Architecture/AppArchitecture.png)

O app utiliza pods (instalar com o comando pod install)
foram feitos testes nas camadas de networking e viewmodel 
Na camada de networking os testes foram realizados com stubs(Mockingjay)
Foi utilizado também as bibliotecas: 
  SnapKit: para autolayout
  RxSwift/RxCocoa: para o mvvm 
  SDWebImage: para cache de imagens 

Ideia de feature: 
  - O app foi pensado na possibilidade de ser escalável, com o uso de coordinators é possivém implementar com facilidade o cadastro 
  de usuario para quando fizer checkin nao precisar reescrever tudo novamente, podendo ser inicializado pela tela de form e salvo com CoreData ou Keychain
  - Filtro de eventos pode ser facilmente implementado na viewModel
  - Alerta de evento próximos

# mobile_app

Desafio Flutter

## Getting Started

Aplicativo acessa uma API REST, passando usuário e senha, e recebe como resposta um token, 
Ao receber o token, o app salva no local (Shared_Preferences), depois faz outra requisição GET,
passando o token autenticado, e recebe os dados os dados e coordenadas do veículo.
Um mapa informa a última localização.
No segundo acesso, o app verifica se já possui um token valido armazenado localmente, e reutiliza ele sem fazer uma nova requisição.


 ### dependencies:
    flutter:
        sdk: flutter
    bloc: ^6.1.1
    equatable: ^1.2.6
    flutter_bloc: ^6.1.2
    get_it: ^5.0.6
    http: ^0.12.2
    shared_preferences: ^0.5.12+4
    google_maps_flutter: ^1.2.0
    flutter_dotenv: ^3.1.0

# .env
LFToken=
LFVehicle=
# mobile_app

Desafio Flutter


## Getting Started

Aplicativo acessa uma API REST, passando usuário e senha, e recebe como resposta um token valido. 
Ao receber o token, o app salva no local (Shared_Preferences), depois faz outra requisição GET passando o token, e recebe os dados e coordenadas do veículo.
Um mapa informa a última localização.
No segundo acesso, o app verifica se já possui um token valido armazenado localmente, e reutiliza ele sem fazer uma nova requisição para receber o token.


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
    

# Variaveis de ambiente
    - Executar:
    
        flutter run --dart-define=LF_MAP_KEY=<GOOGLE_MAP_API_KEY>"
        --dart-define="LF_URLTOKEN=https://rastrear.<API_LF>.com.br/api/auth/token/"
        --dart-define="LF_URLVEHICLE=https://rastrear.<API_LF>.com.br/api/vehicles/" --dart-define="LF_FBASE_KEY=<FIREBASE_API_KEY>"
        --dart-define="LF_FBASE_SIGNIN=https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="
        --dart-define="LF_FBASE_URLVEHICLE=https://<FIREBASE_DATABASE>.firebaseio.com/vehicles.json?auth=<IdToken>"


    - Ou defina no launch.json utilizando o VSCode, da seginte forma:

        {
            "name": "Flutter",
            "type": "dart",
            "request": "launch",
            "program": "lib/main.dart",
            "args": ["--dart-define","LF_MAP_KEY=<GOOGLE_MAP_API_KEY>",
                "--dart-define","LF_URLTOKEN=https://rastrear.<API_LF>.com.br/api/auth/token/",
                "--dart-define","LF_URLVEHICLE=https://rastrear.<API_LF>.com.br/api/vehicles/",
                "--dart-define","LF_FBASE_KEY=<FIREBASE_API_KEY>",
                "--dart-define","LF_FBASE_SIGNIN=https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=",
                "--dart-define","LF_FBASE_URLVEHICLE=https://<FIREBASE_DATABASE>.firebaseio.com/vehicles.json?auth=<IdToken>"
            ]
        }
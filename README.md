# weatherapp

- Esse projeto tem como base aplicações de conhecimentos de Dart e Flutter. 
- Aplicativo de previsão de tempo integrado com a API HG Brasil Weather.

## API HG Brasil Weather
Esse aplicativo integra com a API do HG Brasil. Para fazer a integração você precisa realizar seu cadastro no site da API e gerar sua chave de acesso que será utilizada nas requisições.

[HG BRASIL](https://hgbrasil.com/)

## DOCUMENTAÇÃO API HG Brasil Weather
Segue a documentação da API.

[DOCUMENTAÇÃO HG BRASIl WEATHER](https://console.hgbrasil.com/documentation/weather)

## OBSERVAÇÕES PARA FUNCIONAMENTO DO APP
- Crie um arquivo dentro da pasta assets chamado .env onde o mesmo terá sua BASE_URL e sua API_KEY:
```dart
BASE_URL = 'https://api.hgbrasil.com/weather';
API_KEY = 'Colocar sua chave de acesso aqui';
```

Carregando .env na main.dart:
```dart
Future main() async {
  await dotenv.load(fileName: "assets/.env");
  runApp(const AppWidget());
}
```

Caso desconheça variáveis de ambiente consulte o link abaixo:
[flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

- As mesmas serão carregadas na classe HGWeatherRepository:
```dart
final String? baseURL = dotenv.env["BASE_URL"];
final String? apiKey = dotenv.env["API_KEY"];
```

- O método getWeather faz a chamada a API, onde a mesma usa a LATITUDE E LONGITUDE, por isso faz-se necessário setar as mesmas, o name é somente para título de informação da cidade requisitada:
```dart
controller.getWeather(
    city: City(lat: "-23.5489", lon: "-46.6388", name: "São Paulo"),
);
```





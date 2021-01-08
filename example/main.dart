import 'package:open_weather/current_weather.dart';

void main(List<String> args) async {
  // Set up your API Key in `secrets.yaml`
  var source = await byCityName('Lakeland');
  var weather = CurrentWeather.fromJson(source);

  // or you can use your api key directly in any call
  source = await byZipCode('33801', apiKey: 'your_api_key_here');
  weather = CurrentWeather.fromJson(source);

  // you can also provide a custom url call.
  source = await byCoordinates(-81.9498, 28.0395, baseUrl: 'a new base url');
  weather = CurrentWeather.fromJson(source);

  print(weather);
}

import 'package:open_weather/current_weather.dart';
import 'package:test/test.dart';

void main() {
  group('current weather', () {
    test('can fetch data by city name', () async {
      var data = CurrentWeather.fromJson(await byCityName('Lakeland'));

      expect(data.runtimeType, CurrentWeather);
      expect(data.name, 'Lakeland');
    });
    test('can fetch data by city id', () async {
      var data = CurrentWeather.fromJson(await byCityId(4161438));

      expect(data.runtimeType, CurrentWeather);
      expect(data.name, 'Lakeland');
    });
    test('can fetch data by coordinates', () async {
      var data =
          CurrentWeather.fromJson(await byCoordinates(-81.9498, 28.0395));

      expect(data.runtimeType, CurrentWeather);
      expect(
        data.coord,
        const Coordinates(latitude: -81.9498, longitude: 28.0395),
      );
      expect(
        data.name,
        '',
        reason: 'The name will not be returned from the response.',
      );
    });
    test('can fetch data by zip code', () async {
      var data = CurrentWeather.fromJson(await byZipCode('33801'));

      expect(data.runtimeType, CurrentWeather);
      expect(data.name, 'Lakeland');
    });
  });
}

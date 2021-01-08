import 'dart:io';

import 'package:open_weather/current_weather.dart';
import 'package:test/test.dart';

void main() {
  group('current weather', () {
    test('can fetch data by city name', () async {
      var data = await byCityName('Lakeland');
      stdout.writeln(data);
      var matcher = '';
      expect(data, matcher);
    });
  });
}

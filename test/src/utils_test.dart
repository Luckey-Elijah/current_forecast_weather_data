import 'package:open_weather/current_weather.dart';
import 'package:test/test.dart';

void main() {
  test('pretty json formatter', () {
    var formatted = prettyJson(json);
    expect(formatted, expectedJson);
  });

  group('getSecretKey', () {
    test('raises exception when no file exists', () {
      expect(() => getSecretKey(path: 'no_file.yaml'), throwsException);
    });

    test('raises exception when no identifier exists', () {
      expect(
        () => getSecretKey(path: 'test/assets/secrets_1_test.yaml'),
        throwsArgumentError,
      );
    });

    test('returns a string', () {
      expect(
        getSecretKey(path: 'test/assets/secrets_2_test.yaml').runtimeType,
        String,
      );
    });
  });
}

const json = '''
{"coord": {"lon": -122.08,"lat": 37.39},"weather": [{"id": 800,
"main": "Clear","description": "clear sky","icon": "01d"}],"base":
"stations","main": {"temp": 282.55,"feels_like": 281.86,"temp_min":
280.37,"temp_max": 284.26,"pressure": 1023,"humidity": 100},"visibility":
16093,"wind": {"speed": 1.5,"deg": 350},"clouds": {"all": 1},"dt":
1560350645,"sys": {"type": 1,"id": 5122,"message": 0.0139,"country": "US",
"sunrise": 1560343627,"sunset": 1560396563},"timezone": -25200,"id": 420006353,
"name": "Mountain View","cod": 200}                       
''';
const expectedJson = '''{
    "coord": {
        "lon": -122.08,
        "lat": 37.39
    },
    "weather": [
        {
            "id": 800,
            "main": "Clear",
            "description": "clear sky",
            "icon": "01d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 282.55,
        "feels_like": 281.86,
        "temp_min": 280.37,
        "temp_max": 284.26,
        "pressure": 1023,
        "humidity": 100
    },
    "visibility": 16093,
    "wind": {
        "speed": 1.5,
        "deg": 350
    },
    "clouds": {
        "all": 1
    },
    "dt": 1560350645,
    "sys": {
        "type": 1,
        "id": 5122,
        "message": 0.0139,
        "country": "US",
        "sunrise": 1560343627,
        "sunset": 1560396563
    },
    "timezone": -25200,
    "id": 420006353,
    "name": "Mountain View",
    "cod": 200
}''';

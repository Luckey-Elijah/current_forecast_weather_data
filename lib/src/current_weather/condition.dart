import 'dart:convert';
import 'dart:io';

enum WeatherCondition {
  thunderstorm,
  drizzle,
  rain,
  snow,
  clear,
  clouds,
  mist,
  smoke,
  haze,
  dust,
  fog,
  sand,
  ash,
  squall,
  tornado,
}

class Condition {
  WeatherCondition _cond;
  final int _code;

  Condition(this._code) : assert(WeatherConditionCodes.codes.contains(_code)) {
    _cond = WeatherConditionCodes.getConditionbyCode(code);
  }

  int get code => _code;
  WeatherCondition get condition => _cond;

  set code(int code) => _cond = WeatherConditionCodes.getConditionbyCode(code);

  Map<String, dynamic> toMap() {
    return {
      'condition': condition?.toString(),
      'code': code,
    };
  }

  factory Condition.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Condition(map['code']);
  }

  String toJson() => json.encode(toMap());

  factory Condition.fromJson(String source) =>
      Condition.fromMap(json.decode(source));
}

class WeatherConditionCodes {
  static const _codes = {
    // WeatherConditon.thunderstorm
    200: {
      'main': WeatherCondition.thunderstorm,
      'description': 'thunderstorm with light rain',
    },
    201: {
      'main': WeatherCondition.thunderstorm,
      'description': 'thunderstorm with rain',
    },
    202: {
      'main': WeatherCondition.thunderstorm,
      'description': 'thunderstorm with heavy rain',
    },
    210: {
      'main': WeatherCondition.thunderstorm,
      'description': 'light thunderstorm',
    },
    211: {
      'main': WeatherCondition.thunderstorm,
      'description': 'thunderstorm',
    },
    212: {
      'main': WeatherCondition.thunderstorm,
      'description': 'heavy thunderstorm',
    },
    221: {
      'main': WeatherCondition.thunderstorm,
      'description': 'ragged thunderstorm',
    },
    230: {
      'main': WeatherCondition.thunderstorm,
      'description': 'thunderstorm with light drizzle',
    },
    231: {
      'main': WeatherCondition.thunderstorm,
      'description': 'thunderstorm with drizzle',
    },
    232: {
      'main': WeatherCondition.thunderstorm,
      'description': 'thunderstorm with heavy drizzle',
    },

    // WeatherCondition.drizzle
    300: {
      'main': WeatherCondition.drizzle,
      'description': 'light intensity drizzle',
    },
    301: {
      'main': WeatherCondition.drizzle,
      'description': 'drizzle',
    },
    302: {
      'main': WeatherCondition.drizzle,
      'description': 'heavy intensity drizzle',
    },
    310: {
      'main': WeatherCondition.drizzle,
      'description': 'light intensity drizzle rain',
    },
    311: {
      'main': WeatherCondition.drizzle,
      'description': 'drizzle rain',
    },
    312: {
      'main': WeatherCondition.drizzle,
      'description': 'heavy intensity drizzle rain',
    },
    313: {
      'main': WeatherCondition.drizzle,
      'description': 'shower rain and drizzle',
    },
    314: {
      'main': WeatherCondition.drizzle,
      'description': 'heavy shower rain and drizzle',
    },
    321: {
      'main': WeatherCondition.drizzle,
      'description': 'shower drizzle',
    },

    // WeatherCondition.rain
    500: {
      'main': WeatherCondition.rain,
      'description': 'light rain',
    },
    501: {
      'main': WeatherCondition.rain,
      'description': 'moderate rain',
    },
    502: {
      'main': WeatherCondition.rain,
      'description': 'heavy intensity rain',
    },
    503: {
      'main': WeatherCondition.rain,
      'description': 'very heavy rain',
    },
    504: {
      'main': WeatherCondition.rain,
      'description': 'extreme rain',
    },
    511: {
      'main': WeatherCondition.rain,
      'description': 'freezing rain',
    },
    520: {
      'main': WeatherCondition.rain,
      'description': 'light intensity shower rain',
    },
    521: {
      'main': WeatherCondition.rain,
      'description': 'shower rain',
    },
    522: {
      'main': WeatherCondition.rain,
      'description': 'heavy intensity shower rain',
    },
    531: {
      'main': WeatherCondition.rain,
      'description': 'ragged shower rain',
    },

    // WeatherCondition.snow
    600: {
      'main': WeatherCondition.snow,
      'description': 'light snow',
    },
    601: {
      'main': WeatherCondition.snow,
      'description': 'snow',
    },
    602: {
      'main': WeatherCondition.snow,
      'description': 'heavy snow',
    },
    611: {
      'main': WeatherCondition.snow,
      'description': 'sleet',
    },
    612: {
      'main': WeatherCondition.snow,
      'description': 'light shower sleet',
    },
    613: {
      'main': WeatherCondition.snow,
      'description': 'shower sleet',
    },
    615: {
      'main': WeatherCondition.snow,
      'description': 'light rain and snow',
    },
    616: {
      'main': WeatherCondition.snow,
      'description': 'rain and snow',
    },
    620: {
      'main': WeatherCondition.snow,
      'description': 'light shower snow',
    },
    621: {
      'main': WeatherCondition.snow,
      'description': 'shower snow',
    },
    622: {
      'main': WeatherCondition.snow,
      'description': 'heavy shower snow',
    },

    // Atmosphere conditions
    701: {
      'main': WeatherCondition.mist,
      'description': 'mist',
    },
    711: {
      'main': WeatherCondition.smoke,
      'description': 'smoke',
    },
    721: {
      'main': WeatherCondition.haze,
      'description': 'haze',
    },
    731: {
      'main': WeatherCondition.dust,
      'description': 'sand/dust whirls',
    },
    741: {
      'main': WeatherCondition.fog,
      'description': 'fog',
    },
    751: {
      'main': WeatherCondition.sand,
      'description': 'sand',
    },
    761: {
      'main': WeatherCondition.dust,
      'description': 'dust',
    },
    762: {
      'main': WeatherCondition.ash,
      'description': 'volcanic ash',
    },
    771: {
      'main': WeatherCondition.squall,
      'description': 'squalls',
    },
    781: {
      'main': WeatherCondition.tornado,
      'description': 'tornado',
    },

    // WeatherCondition.clear
    800: {
      'main': WeatherCondition.clear,
      'description': 'clear sky',
    },

    // WeatherCondition.clouds
    801: {
      'main': WeatherCondition.clouds,
      'description': 'few clouds: 11-25%',
    },
    802: {
      'main': WeatherCondition.clouds,
      'description': 'scattered clouds: 25-50%',
    },
    803: {
      'main': WeatherCondition.clouds,
      'description': 'broken clouds: 51-84%',
    },
    804: {
      'main': WeatherCondition.clouds,
      'description': 'overcast clouds: 85-100%',
    },
  };

  static Map<int, Map<String, Object>> get asMap => _codes;

  static List<int> get codes => _codes.keys.toList();

  static WeatherCondition getConditionbyCode(int code) {
    WeatherCondition cond;
    try {
      if (code < 200 || code > 804) {
        throw ArgumentError('The code $code is not in range of 200 - 804.');
      }

      cond = _codes[code]['main'];
      cond ?? (throw ArgumentError('The code $code is not a valid code.'));
    } catch (e) {
      stderr.writeAll(e);
    }
    return cond;
  }
}

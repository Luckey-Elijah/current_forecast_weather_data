An API for [OpenWeather's API](https://openweathermap.org/api) suite.

This repository is under a Mozilla Public License Version 2.0 [license][license].

## Usage

Add your [OpenWeather API key](https://home.openweathermap.org/api_keys) to `secrets.yaml` file:

```yaml
current_forecast_weather_data_api_key: "your_key_goes_here"
```

A simple usage example:

```dart
Future<void> main(List<String> arguments) async {
  var w = CurrentWeather.fromJson(await byCityId(4161438));
  stdout.writeln(w);
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Luckey-Elijah/current_forecast_weather_data/issues
[license]: LICENSE

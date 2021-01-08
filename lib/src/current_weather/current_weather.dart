import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:open_weather/current_weather.dart';
import 'clouds.dart';
import 'coordinates.dart';
import 'main.dart';
import 'system.dart';
import 'wind.dart';

class CurrentWeather {
  final Coordinates coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final DateTime dateTime;
  final System sys;
  final int timezone;
  final int id;
  final String name;
  final int conditionCode;

  Condition get condition => Condition(conditionCode);

  const CurrentWeather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dateTime,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.conditionCode,
  });

  CurrentWeather copyWith({
    Coordinates coord,
    List<Weather> weather,
    String base,
    Main main,
    int visibility,
    Wind wind,
    Clouds clouds,
    DateTime dateTime,
    System sys,
    int timezone,
    int id,
    String name,
    int conditionCode,
  }) {
    return CurrentWeather(
      coord: coord ?? this.coord,
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dateTime: dateTime ?? this.dateTime,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      conditionCode: conditionCode ?? conditionCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'coord': coord?.toMap(),
      'weather': weather?.map((x) => x?.toMap())?.toList(),
      'base': base,
      'main': main?.toMap(),
      'visibility': visibility,
      'wind': wind?.toMap(),
      'clouds': clouds?.toMap(),
      'dt': dateTime.toUtc(),
      'sys': sys?.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': conditionCode,
    };
  }

  factory CurrentWeather.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CurrentWeather(
      coord: Coordinates.fromMap(map['coord']),
      weather:
          List<Weather>.from(map['weather']?.map((x) => Weather.fromMap(x))),
      base: map['base'],
      main: Main.fromMap(map['main']),
      visibility: map['visibility'],
      wind: Wind.fromMap(map['wind']),
      clouds: Clouds.fromMap(map['clouds']),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dt']),
      sys: System.fromMap(map['sys']),
      timezone: map['timezone'],
      id: map['id'],
      name: map['name'],
      conditionCode: map['cod'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeather.fromJson(String source) =>
      CurrentWeather.fromMap(json.decode(source));

  @override
  String toString() =>
      'CurrentWeather(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, clouds: $clouds, dateTime: $dateTime, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $conditionCode)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return o is CurrentWeather &&
        o.coord == coord &&
        listEquals(o.weather, weather) &&
        o.base == base &&
        o.main == main &&
        o.visibility == visibility &&
        o.wind == wind &&
        o.clouds == clouds &&
        o.dateTime == dateTime &&
        o.sys == sys &&
        o.timezone == timezone &&
        o.id == id &&
        o.name == name &&
        o.conditionCode == conditionCode;
  }

  @override
  int get hashCode {
    return coord.hashCode ^
        weather.hashCode ^
        base.hashCode ^
        main.hashCode ^
        visibility.hashCode ^
        wind.hashCode ^
        clouds.hashCode ^
        dateTime.hashCode ^
        sys.hashCode ^
        timezone.hashCode ^
        id.hashCode ^
        name.hashCode ^
        conditionCode.hashCode;
  }
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Weather copyWith({
    int id,
    String main,
    String description,
    String icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Weather(
      id: map['id'],
      main: map['main'],
      description: map['description'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() =>
      'Weather(id: $id, main: $main, description: $description, icon: $icon)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weather &&
        o.id == id &&
        o.main == main &&
        o.description == description &&
        o.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}

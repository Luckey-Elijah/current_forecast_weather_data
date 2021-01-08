import 'dart:convert';

class Main {
  final double tempurature;
  final double feelsLike;
  final double tempuratureMinimum;
  final double tempuratureMaximum;
  final int pressure;
  final int humidity;

  const Main({
    this.tempurature,
    this.feelsLike,
    this.tempuratureMinimum,
    this.tempuratureMaximum,
    this.pressure,
    this.humidity,
  });

  Main copyWith({
    double temp,
    double feelsLike,
    double tempMin,
    double tempMax,
    int pressure,
    int humidity,
  }) {
    return Main(
      tempurature: tempurature ?? this.tempurature,
      feelsLike: feelsLike ?? this.feelsLike,
      tempuratureMinimum: tempuratureMinimum ?? this.tempuratureMinimum,
      tempuratureMaximum: tempuratureMaximum ?? this.tempuratureMaximum,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': tempurature,
      'feels_like': feelsLike,
      'temp_min': tempuratureMinimum,
      'temp_max': tempuratureMaximum,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Main(
      tempurature: map['temp'],
      feelsLike: map['feels_like'],
      tempuratureMinimum: map['temp_min'],
      tempuratureMaximum: map['temp_max'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Main(temp: $tempurature, feelsLike: $feelsLike, tempMin: $tempuratureMinimum, tempMax: $tempuratureMaximum, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Main &&
        o.tempurature == tempurature &&
        o.feelsLike == feelsLike &&
        o.tempuratureMinimum == tempuratureMinimum &&
        o.tempuratureMaximum == tempuratureMaximum &&
        o.pressure == pressure &&
        o.humidity == humidity;
  }

  @override
  int get hashCode {
    return tempurature.hashCode ^
        feelsLike.hashCode ^
        tempuratureMinimum.hashCode ^
        tempuratureMaximum.hashCode ^
        pressure.hashCode ^
        humidity.hashCode;
  }
}

import 'dart:convert';

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
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
      temp: temp ?? this.temp,
      feelsLike: feelsLike ?? this.feelsLike,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'feelsLike': feelsLike,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Main(
      temp: map['temp'],
      feelsLike: map['feelsLike'],
      tempMin: map['tempMin'],
      tempMax: map['tempMax'],
      pressure: map['pressure'],
      humidity: map['humidity'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Main(temp: $temp, feelsLike: $feelsLike, tempMin: $tempMin, tempMax: $tempMax, pressure: $pressure, humidity: $humidity)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Main &&
        o.temp == temp &&
        o.feelsLike == feelsLike &&
        o.tempMin == tempMin &&
        o.tempMax == tempMax &&
        o.pressure == pressure &&
        o.humidity == humidity;
  }

  @override
  int get hashCode {
    return temp.hashCode ^
        feelsLike.hashCode ^
        tempMin.hashCode ^
        tempMax.hashCode ^
        pressure.hashCode ^
        humidity.hashCode;
  }
}

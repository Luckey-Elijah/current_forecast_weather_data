import 'dart:convert';

class Wind {
  double speed;
  int deg;

  Wind({this.speed, this.deg});

  Wind copyWith({double speed, int deg}) =>
      Wind(speed: speed ?? this.speed, deg: deg ?? this.deg);

  Map<String, dynamic> toMap() => {'speed': speed, 'deg': deg};

  factory Wind.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Wind(
      speed: map['speed'],
      deg: map['deg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));

  @override
  String toString() => 'Wind(speed: $speed, deg: $deg)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Wind && o.speed == speed && o.deg == deg;
  }

  @override
  int get hashCode => speed.hashCode ^ deg.hashCode;
}

import 'dart:convert';

class Wind {
  final double speed;
  final int degrees;

  const Wind({this.speed, this.degrees});

  Wind copyWith({double speed, int degrees}) {
    return Wind(speed: speed ?? this.speed, degrees: degrees ?? this.degrees);
  }

  Map<String, dynamic> toMap() => {'speed': speed, 'deg': degrees};

  factory Wind.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Wind(
      speed: map['speed'],
      degrees: map['deg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Wind.fromJson(String source) => Wind.fromMap(json.decode(source));

  @override
  String toString() => 'Wind(speed: $speed, degrees: $degrees)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Wind && o.speed == speed && o.degrees == degrees;
  }

  @override
  int get hashCode => speed.hashCode ^ degrees.hashCode;
}

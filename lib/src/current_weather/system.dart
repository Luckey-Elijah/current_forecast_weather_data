import 'dart:convert';

class System {
  int type;
  int id;
  double message;
  String country;
  int sunrise;
  int sunset;

  System({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  System copyWith(
      {int type,
      int id,
      double message,
      String country,
      int sunrise,
      int sunset}) {
    return System(
      type: type ?? this.type,
      id: id ?? this.id,
      message: message ?? this.message,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  Map<String, dynamic> toMap() => {
        'type': type,
        'id': id,
        'message': message,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };

  factory System.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return System(
      type: map['type'],
      id: map['id'],
      message: map['message'],
      country: map['country'],
      sunrise: map['sunrise'],
      sunset: map['sunset'],
    );
  }

  String toJson() => json.encode(toMap());

  factory System.fromJson(String source) => System.fromMap(json.decode(source));

  @override
  String toString() {
    return 'System(type: $type, id: $id, message: $message, country: $country, sunrise: $sunrise, sunset: $sunset)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is System &&
        o.type == type &&
        o.id == id &&
        o.message == message &&
        o.country == country &&
        o.sunrise == sunrise &&
        o.sunset == sunset;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        id.hashCode ^
        message.hashCode ^
        country.hashCode ^
        sunrise.hashCode ^
        sunset.hashCode;
  }
}

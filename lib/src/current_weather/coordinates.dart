import 'dart:convert';

class Coordinates {
  final double longitude;
  final double latitude;

  const Coordinates({this.longitude, this.latitude});

  Coordinates copyWith({double longitude, double latitude}) {
    return Coordinates(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() => {
        'lon': longitude,
        'lat': latitude,
      };

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Coordinates(
      longitude: map['lon'],
      latitude: map['lat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source));

  @override
  String toString() =>
      'Coordinates(longitude: $longitude, latitude: $latitude)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Coordinates &&
        o.longitude == longitude &&
        o.latitude == latitude;
  }

  @override
  int get hashCode => longitude.hashCode ^ latitude.hashCode;
}

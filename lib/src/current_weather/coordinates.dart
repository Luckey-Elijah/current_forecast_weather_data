import 'dart:convert';

class Coordinates {
  double longitude;
  double latitude;

  Coordinates({this.longitude, this.latitude});

  Coordinates copyWith({double longitude, double latitude}) {
    return Coordinates(
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() => {
        'longitude': longitude,
        'latitude': latitude,
      };

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Coordinates(
      longitude: map['longitude'],
      latitude: map['latitude'],
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

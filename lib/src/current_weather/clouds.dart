import 'dart:convert';

class Clouds {
  int value;
  String name;

  Clouds({
    this.value,
    this.name,
  });

  Clouds copyWith({int value, String name}) =>
      Clouds(value: value ?? this.value, name: name ?? this.name);

  Map<String, dynamic> toMap() => {
        'value': value,
        'name': name,
      };

  factory Clouds.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Clouds(
      value: map['value'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source));

  @override
  String toString() => 'Clouds(value: $value, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Clouds && o.value == value && o.name == name;
  }

  @override
  int get hashCode => value.hashCode ^ name.hashCode;
}

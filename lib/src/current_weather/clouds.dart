import 'dart:convert';

class Clouds {
  final int all;

  const Clouds({this.all});

  Clouds copyWith({int all}) => Clouds(all: all ?? this.all);

  Map<String, dynamic> toMap() => {'all': all};

  factory Clouds.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Clouds(
      all: map['all'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source));

  @override
  String toString() => 'Clouds(all: $all)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Clouds && o.all == all;
  }

  @override
  int get hashCode => all.hashCode;
}

import 'dart:convert';

class Cities {
  final String city;
  final String confirmed;
  Cities({
    this.city,
    this.confirmed,
  });

  Cities copyWith({
    String city,
    String confirmed,
  }) {
    return Cities(
      city: city ?? this.city,
      confirmed: confirmed ?? this.confirmed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'confirmed': confirmed,
    };
  }

  static Cities fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Cities(
      city: map['city'],
      confirmed: map['confirmed'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  static Cities fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Cities(city: $city, confirmed: $confirmed)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Cities && o.city == city && o.confirmed == confirmed;
  }

  @override
  int get hashCode => city.hashCode ^ confirmed.hashCode;
}

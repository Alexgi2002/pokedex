import 'dart:convert';

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  factory Ability.fromMap(Map<String, dynamic> data) => Ability(
        url: data['url'] as String?,
        name: data['name'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Stat].
  factory Ability.fromJson(String data) {
    return Ability.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Stat] to a JSON string.
  String toJson() => json.encode(toMap());
}

import 'dart:convert';

class Stat {
  String? name;
  String? url;

  Stat({this.name, this.url});

  factory Stat.fromMap(Map<String, dynamic> data) => Stat(
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
  factory Stat.fromJson(String data) {
    return Stat.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Stat] to a JSON string.
  String toJson() => json.encode(toMap());
}

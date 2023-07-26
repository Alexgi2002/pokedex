import 'dart:convert';

class Move {
  String? name;
  String? url;

  Move({this.name, this.url});

  factory Move.fromMap(Map<String, dynamic> data) => Move(
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
  factory Move.fromJson(String data) {
    return Move.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Stat] to a JSON string.
  String toJson() => json.encode(toMap());
}

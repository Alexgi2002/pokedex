// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class PokeData {
  String name;
  String url;
  
  PokeData({
    required this.name,
    required this.url,
  });

  PokeData copyWith({
    String? name,
    String? url,
  }) {
    return PokeData(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokeData.fromMap(Map<String, dynamic> map) {
    return PokeData(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokeData.fromJson(String source) => PokeData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'PokeData(name: $name, url: $url)';

  @override
  bool operator ==(covariant PokeData other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

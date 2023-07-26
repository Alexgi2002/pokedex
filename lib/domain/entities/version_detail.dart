import 'dart:convert';

import 'version.dart';

class VersionDetail {
  int? rarity;
  Version? version;

  VersionDetail({this.rarity, this.version});

  factory VersionDetail.fromMap(Map<String, dynamic> data) => VersionDetail(
        rarity: data['rarity'] as int?,
        version: data['version'] == null
            ? null
            : Version.fromMap(data['version'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'rarity': rarity,
        'version': version?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [VersionDetail].
  factory VersionDetail.fromJson(String data) {
    return VersionDetail.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VersionDetail] to a JSON string.
  String toJson() => json.encode(toMap());
}

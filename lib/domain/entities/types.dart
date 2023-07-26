import 'dart:convert';

import 'package:pokedex/domain/entities/type.dart';

class Types {
  int? slot;
  Type? type;

  Types({this.slot, this.type});

  factory Types.fromMap(Map<String, dynamic> data) => Types(
        slot: data['slot'] as int?,
        type: data['type'] == null
            ? null
            : Type.fromMap(data['type'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'slot': slot,
        'type': type?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Type].
  factory Types.fromJson(String data) {
    return Types.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Type] to a JSON string.
  String toJson() => json.encode(toMap());
}

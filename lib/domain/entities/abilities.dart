import 'dart:convert';

import 'package:pokedex/domain/entities/ability.dart';

class Abilities {
  Ability? ability;
  bool? isHidden;
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromMap(Map<String, dynamic> data) => Abilities(
        ability: data['ability'] == null
            ? null
            : Ability.fromMap(data['ability'] as Map<String, dynamic>),
        isHidden: data['is_hidden'] as bool?,
        slot: data['slot'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'ability': ability?.toMap(),
        'is_hidden': isHidden,
        'slot': slot,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Ability].
  factory Abilities.fromJson(String data) {
    return Abilities.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Ability] to a JSON string.
  String toJson() => json.encode(toMap());
}

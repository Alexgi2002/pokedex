import 'dart:convert';

import 'package:pokedex/domain/entities/stat.dart';

class Stats {
  int? baseStat;
  int? effort;
  Stat? stat;

  Stats({this.baseStat, this.effort, this.stat});

  factory Stats.fromMap(Map<String, dynamic> data) => Stats(
        baseStat: data['base_stat'] as int?,
        effort: data['effort'] as int?,
        stat: data['stat'] == null
            ? null
            : Stat.fromMap(data['stat'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Stat].
  factory Stats.fromJson(String data) {
    return Stats.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Stat] to a JSON string.
  String toJson() => json.encode(toMap());
}

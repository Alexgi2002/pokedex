import 'dart:convert';
import 'package:pokedex/domain/entities/move.dart';

import 'version_group_detail.dart';

class Moves {
  Move? move;
  List<VersionGroupDetail>? versionGroupDetails;

  Moves({this.move, this.versionGroupDetails});

  factory Moves.fromMap(Map<String, dynamic> data) => Moves(
        move: data['move'] == null
            ? null
            : Move.fromMap(data['move'] as Map<String, dynamic>),
        versionGroupDetails: (data['version_group_details'] as List<dynamic>?)
            ?.map((e) => VersionGroupDetail.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'move': move?.toMap(),
        'version_group_details':
            versionGroupDetails?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Move].
  factory Moves.fromJson(String data) {
    return Moves.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Move] to a JSON string.
  String toJson() => json.encode(toMap());
}

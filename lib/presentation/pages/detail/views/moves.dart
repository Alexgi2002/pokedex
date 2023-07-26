import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/moves.dart' as mv;

class Moves extends StatelessWidget {
  const Moves(this.moves, {super.key});

  final List<mv.Moves> moves;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: moves.map((e){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Chip(label: Text(e.move!.name!)),
          );
        }).toList(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/abilities.dart';

class About extends StatelessWidget {
  const About({super.key, required this.specie, required this.heigth, required this.weight, required this.abilities});

  final String specie;
  final int heigth;
  final int weight;
  final List<Abilities> abilities;

  @override
  Widget build(BuildContext context) {
    String aby = "";
    for (var element in abilities) {
      aby += "${element.ability!.name!}, ";
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: Text("Especie", style: Theme.of(context).textTheme.titleMedium,),
            subtitle: Text(specie),
          ),
          ListTile(
            leading: const Icon(Icons.height_outlined),
            title: Text("Altura", style: Theme.of(context).textTheme.titleMedium,),
            subtitle: Text("$heigth"),
          ),
          ListTile(
            leading: const Icon(Icons.line_weight_outlined),
            title: Text("Peso", style: Theme.of(context).textTheme.titleMedium,),
            subtitle: Text("$weight"),
          ),
          ListTile(
            leading: const Icon(Icons.accessibility_outlined),
            title: Text("Habilidades", style: Theme.of(context).textTheme.titleMedium,),
            subtitle: Text(aby),
          ),

        ],
      )
    );
  }
}
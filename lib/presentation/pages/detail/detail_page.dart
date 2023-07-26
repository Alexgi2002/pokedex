import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/poke.dart';
import 'package:pokedex/presentation/pages/detail/views/about.dart';
import 'package:pokedex/presentation/pages/detail/views/moves.dart';
import 'package:pokedex/presentation/pages/detail/views/stats.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.poke, {super.key});

  static const String path = "/details";
  final Poke? poke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(poke!=null? "${poke!.name}" : "Error")),
      body: poke==null ? const Center(
        child: Text("Ocurrio un error"),
      ) : DefaultTabController(
        length: 3,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: poke!.sprites!.frontDefault!,
              placeholder: (context, url) {
                return const CircularProgressIndicator();
              },
              height: 230,
              fit: BoxFit.cover,
            ),
            Wrap(
              children: poke!.types!.map((e){
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Chip(label: Text(e.type!.name!)),
                  );
                }).toList(),
            ),
            const TabBar(
              tabs: [
                Tab(text: "Acerca de",),
                Tab(text: "Estadisticas",),
                Tab(text: "Movimientos",),
              ]
            ),
            Expanded(
              child: TabBarView(
                children: [
                  About(specie: poke!.species!.name!, abilities: poke!.abilities!, heigth: poke!.height!, weight: poke!.weight!),
                  Stats(poke!.stats!),
                  Moves(poke!.moves!),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

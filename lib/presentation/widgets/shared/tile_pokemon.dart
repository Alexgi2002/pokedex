import 'package:flutter/material.dart';
import 'package:pokedex/data/api/api_consumer.dart';
import 'package:pokedex/domain/entities/poke.dart';
import 'package:pokedex/domain/entities/poke_data.dart';
import 'package:pokedex/presentation/widgets/shared/card_pokemon.dart';

class TilePokemon extends StatelessWidget {
  const TilePokemon(this.pokeData, {super.key});

  final PokeData pokeData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Poke>(
      future: getData(pokeData.url),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data!=null){
          return CardPokemon(snapshot.data!);
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10,),
              Text("Cargando ${pokeData.name}")
            ],
          ),
        );
      },
    );
  }

  Future<Poke> getData(String url) async {
    return await ApiConsumer.getInstance().getPoke(url);
  }
}
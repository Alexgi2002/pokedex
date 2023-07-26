import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/domain/entities/poke_data.dart';
import 'package:pokedex/presentation/bloc/main_bloc.dart';
import 'package:pokedex/presentation/widgets/shared/tile_pokemon.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  static const String path = "/team";

  @override
  Widget build(BuildContext context) {

    MainBloc mainBloc = BlocProvider.of<MainBloc>(context);

    // List<int> ids = [];
    List<String> ids = mainBloc.prefs.getStringList("pokes") ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipo de ${mainBloc.prefs.getString("name")}\n${mainBloc.prefs.getString("team")??""}"),
      ),
      body: ids.isNotEmpty? GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: ids.length,
        itemBuilder: (context, index) {
          return TilePokemon(PokeData(name: "", url: "$url/${ids[index]}/"));
        },
      ) : const Center(
        child: Text("Nada para mostrar"),
      ),
    );
  }
}

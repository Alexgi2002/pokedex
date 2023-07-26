import 'package:fl_paging/fl_paging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/config/utils.dart';
import 'package:pokedex/data/api/api_consumer.dart';
import 'package:pokedex/domain/entities/poke_data.dart';
import 'package:pokedex/domain/pagination/pagination_home.dart';
import 'package:pokedex/presentation/bloc/main_bloc.dart';
import 'package:pokedex/presentation/pages/team_page.dart';
import 'package:pokedex/presentation/widgets/shared/tile_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String path = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PaginationHome dataSource = PaginationHome(ApiConsumer.getInstance());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<MainBloc>(context).add(PickingPokemon(false));
                context.push(TeamPage.path);
              },
              icon: const Icon(Icons.list_outlined))
        ],
      ),
      body: PagingGridView<PokeData>(
        delegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, data, child) => TilePokemon(data),
        pageDataSource: dataSource,
        loadingBuilder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.picking? FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<MainBloc>(context).add(PickingPokemon(false));
                },
                child: const Icon(Icons.clear_rounded),
              ) : const SizedBox(),
              const SizedBox(height: 20,),
              FloatingActionButton(
                onPressed: state.picking? () {
                  if(state.idsPicking.length<6){
                    Utils.showSnackBar(context, "Debe seleccionar 6 pokemones");
                    return;
                  }
                  showDialog(
                    context: context,
                    builder: (context) {
                      String name = "";
                      return AlertDialog(
                        title: const Text("Crear equipo"),
                        content: TextField(
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              labelText: "Nombre de equipo"),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        actions: [
                          FilledButton.tonal(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar")
                          ),
                          FilledButton(
                            onPressed: () {
                              final bloc = BlocProvider.of<MainBloc>(context);
                              bloc.prefs.setString("team", name);
                              final List<String> data = [];
                              for(final s in state.idsPicking){
                                data.add("$s");
                              }
                              bloc.prefs.setStringList("pokes", data);

                              bloc.add(PickingPokemon(false));
                              Navigator.pop(context);
                            },
                            child: const Text("Aceptar")
                          ),
                        ],
                      );
                    },
                  );
                } : (){
                  BlocProvider.of<MainBloc>(context).add(PickingPokemon(true));
                },
                child: state.picking? const Icon(Icons.skip_next_outlined) : const Icon(Icons.list_alt_outlined),
              ),
            ],
          );
        },
      ),
    );
  }
}

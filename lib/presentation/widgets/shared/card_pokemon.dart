import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/utils.dart';
import 'package:pokedex/domain/entities/poke.dart';
import 'package:pokedex/presentation/bloc/main_bloc.dart';
import 'package:pokedex/presentation/pages/detail/detail_page.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon(this.poke, {super.key});

  final Poke poke;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: state.picking? null : () {
            context.push(DetailPage.path, extra: poke);      
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    poke.name!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      state.picking? Checkbox(
                        value: state.idsPicking.contains(poke.id!), 
                        onChanged: (value) {
                          if(value!=null) {
                            if(value && state.idsPicking.length>=6){
                              Utils.showSnackBar(context, "Limite alcanzado");
                              return;
                            }
                            
                            BlocProvider.of<MainBloc>(context).add(PickPokemon(poke.id!));
                          }
                        },  
                      ) 
                      : Flexible(
                        child: Wrap(
                          children: [
                            ...poke.types!.map((e) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Chip(label: Text(e.type!.name!)),
                              );
                            })
                          ],
                        ),
                      ),
                      CachedNetworkImage(
                        imageUrl: poke.sprites!.frontDefault!,
                        placeholder: (context, url) {
                          return const CircularProgressIndicator();
                        },
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

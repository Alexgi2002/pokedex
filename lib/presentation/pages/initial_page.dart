import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/config/utils.dart';
import 'package:pokedex/presentation/bloc/main_bloc.dart';

// ignore: must_be_immutable
class InitPage extends StatelessWidget {
  InitPage({super.key});

  static const String path = "/init";

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Bienvenido", style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: "Nombre de usuario"),
                onChanged: (value) {
                  name = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              FilledButton(
                  onPressed: () async {
                    if (name.isNotEmpty) {
                      BlocProvider.of<MainBloc>(context)
                          .prefs
                          .setString('name', name);
                      context.go("/home");
                    } else {
                      Utils.showSnackBar(context, "Compruebe el nombre");
                    }
                  },
                  child: const Text("GUARDAR"))
            ],
          ),
        ),
      ),
    );
  }
}

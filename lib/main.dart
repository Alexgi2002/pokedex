import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/config/routes/routes.dart';
import 'package:pokedex/presentation/bloc/main_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MainApp(prefs));
}

class MainApp extends StatelessWidget {
  const MainApp(this.prefs, {super.key});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(prefs),
      child: MaterialApp.router(
        title: appName,
        routerConfig: route,
        themeMode: ThemeMode.system,
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.red,
            brightness: Brightness.light),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.red,
            brightness: Brightness.dark),
      ),
    );
  }
}

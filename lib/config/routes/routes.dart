import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/domain/entities/poke.dart';
import 'package:pokedex/presentation/bloc/main_bloc.dart';
import 'package:pokedex/presentation/pages/detail/detail_page.dart';
import 'package:pokedex/presentation/pages/home_page.dart';
import 'package:pokedex/presentation/pages/initial_page.dart';
import 'package:pokedex/presentation/pages/team_page.dart';

final route = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    redirect: (context, state) async {
      final String name =
          BlocProvider.of<MainBloc>(context).prefs.getString('name') ?? "";

      if (name.isEmpty) {
        return InitPage.path;
      }

      return HomePage.path;
    },
  ),
  GoRoute(
    path: HomePage.path,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: InitPage.path,
    builder: (context, state) => InitPage(),
  ),
  GoRoute(
    path: TeamPage.path,
    builder: (context, state) => const TeamPage(),
  ),
  GoRoute(
    path: DetailPage.path,
    builder: (context, state){
      return DetailPage(state.extra is Poke? state.extra as Poke : null);
    },
  ),
]);

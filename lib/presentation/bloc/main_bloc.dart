import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  late final SharedPreferences prefs;

  MainBloc(
    this.prefs,
  ) : super(MainState(false, [])) {

    List<int> idsPicking = [];
    on<PickPokemon>((event, emit) async {
      if(idsPicking.contains(event.id)) {
        idsPicking.remove(event.id);
      }
      else {
        idsPicking.add(event.id);
      }
      emit(MainState(state.picking, idsPicking));
    });

    on<PickingPokemon>((event, emit) async {
      if(!event.picking) idsPicking = [];
      emit(MainState(event.picking, idsPicking));
    });
  }
}

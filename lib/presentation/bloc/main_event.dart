// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class PickPokemon extends MainEvent {
  final int id;
  PickPokemon(this.id);
}

class PickingPokemon extends MainEvent {
  final bool picking;
  PickingPokemon(this.picking);
}

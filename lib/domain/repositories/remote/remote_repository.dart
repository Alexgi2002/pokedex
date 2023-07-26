
import 'package:pokedex/domain/entities/poke.dart';
import 'package:pokedex/domain/entities/poke_data.dart';

abstract class RemoteRepository {

  Future<List<PokeData>> getPagePoke(int page);

  Future<Poke> getPoke(String path);

}
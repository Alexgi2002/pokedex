import 'package:pokedex/config/constants.dart';
import 'package:pokedex/data/dio/my_dio.dart';
import 'package:pokedex/domain/entities/poke.dart';
import 'package:pokedex/domain/entities/poke_data.dart';
import 'package:pokedex/domain/repositories/remote/remote_repository.dart';

class ApiConsumer extends RemoteRepository{

  static ApiConsumer? _instance;
  late MyDio mydio;
  
  static ApiConsumer getInstance(){
    _instance ??= ApiConsumer();
    return _instance!;
  }

  ApiConsumer(){
    mydio = MyDio();
  }

  @override
  Future<List<PokeData>> getPagePoke(int page) async {
    final response = await mydio.request(requestType: RequestType.GET, path: "$url/?offset=$page");
    return List<PokeData>.from(response["results"].map((x) => PokeData.fromMap(x)));
  }

  @override
  Future<Poke> getPoke(String path) async {
    final response = await mydio.request(requestType: RequestType.GET, path: path);
    return Poke.fromMap(response);
  }

}
import 'package:fl_paging/fl_paging.dart';
import 'package:pokedex/domain/entities/poke_data.dart';
import 'package:pokedex/domain/repositories/remote/remote_repository.dart';
import 'package:tuple/tuple.dart';

class PaginationHome extends PageKeyedDataSource<int, PokeData> {
  
  RemoteRepository repository;

  PaginationHome(this.repository);

  @override
  Future<Tuple2<List<PokeData>, int>> loadInitial(int pageSize) async {
    return Tuple2(await repository.getPagePoke(0), 1);
  }

  @override
  Future<Tuple2<List<PokeData>, int>> loadPageAfter(int params, int pageSize) async {
    print("LOAD PAGE AFTER");
    print(params);
    print(pageSize);
    return Tuple2(await repository.getPagePoke(pageSize * params), params + 1);
  }

  
}
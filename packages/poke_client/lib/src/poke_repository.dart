
import 'package:poke_client/src/poke_api_client.dart';

import 'models/models.dart';

class PokeRepository {
  const PokeRepository(this.client);

  final PokeApiClient client;

  Future<Pokemon> search(String query) async {
    return client.search(query);
  }

  Future<InfiniteListPokemon> searchAll([int offset = 0]) async {
    return client.searchAll(offset);
  }

}
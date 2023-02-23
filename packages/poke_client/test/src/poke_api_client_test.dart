
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_client/poke_client.dart';
import 'package:test/test.dart';

import 'poke_api_client_test.mocks.dart';
@GenerateMocks([http.Client])
void main() {
  group('PokeApiClient', () {
    test('return a pokemon', () {

      final client = MockClient();
      when(client
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1')))
          .thenAnswer((_) async => http.Response('{"name": "bulbasaur"}', 200));

      expect(PokeApiClient().search("1"), completion(isA<Pokemon>()));

    });

    test('return a list of pokemon result', () {

      final client = MockClient();
      when(client
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=30')))
          .thenAnswer((_) async => http.Response('{"results": [{"name": "bulbasaur"}]}', 200));
      expect(PokeApiClient().searchAll(), completion(isA<InfiniteListPokemon>()));
    });

  });
}
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_client/poke_client.dart';
import 'package:test/test.dart';

import 'poke_repository_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
  group('PokeRepository', () {
   test('return a pokemon', () {
     final client = MockClient();
     PokeRepository pokeRepository = PokeRepository(PokeApiClient());

     when(client
         .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1')))
         .thenAnswer((_) async => http.Response('{"name": "bulbasaur"}', 200));


      expect(pokeRepository.search("1"), completion(isA<Pokemon>()));
   });

   test('return a list of pokemon result', () {
     final client = MockClient();
     PokeRepository pokeRepository = PokeRepository(PokeApiClient());

     when(client
         .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?offset=0&limit=30')))
         .thenAnswer((_) async => http.Response('{"results": [{"name": "bulbasaur"}]}', 200));

      expect(pokeRepository.searchAll(), completion(isA<InfiniteListPokemon>()));
   });

  });
}
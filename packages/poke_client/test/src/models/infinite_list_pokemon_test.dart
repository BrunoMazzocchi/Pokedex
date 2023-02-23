
import 'package:poke_client/src/models/models.dart';
import 'package:test/test.dart';

void main() {
  group('InfiniteListPokemon', () {
    test('should return a list of result', () {
      final infiniteListPokemon = InfiniteListPokemon(

        next: 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
        previous: null,
        results: [
          Result(name: "Pikachu", url: "https://pokeapi.co/api/v2/pokemon/25/"),
        ],
      );

      expect(infiniteListPokemon.results, isA<List<Result>>());
    });
    test('shouuld be parsed from a json',  () {
      final infiniteListPokemon = InfiniteListPokemon.fromJson({
        'next': 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
        'previous': null,
        'results': [
          {
            'name': "Pikachu",
            'url': "https://pokeapi.co/api/v2/pokemon/25/",
          },
        ],
      });

      expect(infiniteListPokemon.results, isA<List<Result>>());
  });
  });
}
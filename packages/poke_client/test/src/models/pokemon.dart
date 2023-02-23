
import 'package:poke_client/src/models/pokemon.dart';
import 'package:test/test.dart';

void main() {
  group('Pokemon', () {
    test('can be instantiated', () {
      expect(const Pokemon(id: 1, name: 'name', height: 1, weight: 1, order: 1,
          baseExperience: 1, abilities: [], moves: [], types: [],), isNotNull,
      );
    });

    test('can be instantiated from json', () {
      expect(Pokemon.fromJson({
        'id': 1,
        'name': 'name',
        'height': 1,
        'weight': 1,
        'order': 1,
        'base_experience': 1,
        'abilities': [],
        'moves': [],
        'types': [],
      }), isNotNull);
    });
  });
}
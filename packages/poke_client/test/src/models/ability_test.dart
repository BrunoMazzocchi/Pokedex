
import 'package:poke_client/src/models/ability.dart';
import 'package:test/test.dart';

void main() {
  group('Ability', () {
    test('can be instantiated', () {
      expect(const Ability(name: 'name', url: 'url'), isNotNull);
    });

    test('can be instantiated from json', () {
      expect(Ability.fromJson({'name': 'name', 'url': 'url'}), isNotNull);
    });
  });
}
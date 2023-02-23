
import 'package:poke_client/src/models/type.dart';
import 'package:test/test.dart';

void main () {
  group('Type', () {
    test('can be instantiated', () {
      expect(const Type(name: 'name', url: 'url'), isNotNull);
    });

    test('can be instantiated from json', () {
      expect(Type.fromJson({'name': 'name', 'url': 'url'}), isNotNull);
    });
  });
}
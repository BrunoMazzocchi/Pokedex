// ignore_for_file: prefer_const_constructors
import 'package:poke_client/poke_client.dart';
import 'package:test/test.dart';

void main() {
  group('PokeClient', () {
    test('can be instantiated', () {
      expect(PokeClient(), isNotNull);
    });
  });
}

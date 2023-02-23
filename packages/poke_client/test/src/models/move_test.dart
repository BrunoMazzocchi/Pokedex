

import 'package:poke_client/src/models/move.dart';
import 'package:test/test.dart';

void main(){
  group('Move', (){
    test('can be instantiated', (){
      expect(const Move(name: 'name', url: 'url'), isNotNull);
    });

    test('can be instantiated from json', (){
      expect(Move.fromJson({'name': 'name', 'url': 'url'}), isNotNull);
    });
  });
}
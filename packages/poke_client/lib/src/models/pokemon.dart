import 'package:json_annotation/json_annotation.dart';
import 'package:poke_client/src/models/move.dart';

import 'abilities.dart';
import 'moves.dart';
/// A Pokemon model class
@JsonSerializable()
class Pokemon {

  const Pokemon(
      {required this.id,
      required this.name,
      required this.height,
      required this.weight,
      required this.order,
      required this.baseExperience,
      required this.abilities,
      required this.moves});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      height: json['height'] as int,
      weight: json['weight'] as int,
      order: json['order'] as int,
      baseExperience: json['base_experience'] as int,
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>)
          .map((e) => Moves.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  static final empty = Pokemon(
      id: 0,
      name: '',
      height: 0,
      weight: 0,
      order: 0,
      baseExperience: 0,
      abilities: [],
      moves: []
  );

  final int id;
  final String name;
  final int height;
  final int weight;
  final int order;
  final int baseExperience;
  final List<Abilities> abilities;
  final List<Moves> moves;
}


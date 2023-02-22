import 'package:json_annotation/json_annotation.dart';
import 'package:poke_client/src/models/move.dart';

/// Moves model
@JsonSerializable()
class Moves {


  const Moves({required this.move});

  factory Moves.fromJson(Map<String, dynamic> json) {
    return Moves(
      move: Move.fromJson(json['move'] as Map<String, dynamic>),
    );
  }
  final Move move;
}

import 'package:json_annotation/json_annotation.dart';
/// PokemonError model
@JsonSerializable()
class PokemonError implements Exception{
  final String? error;

  PokemonError({this.error});

  factory PokemonError.fromJson(Map<String, dynamic> json) {
    return PokemonError(
      error: json['error'] as String?,
    );
  }
}
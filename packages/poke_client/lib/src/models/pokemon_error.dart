
import 'package:json_annotation/json_annotation.dart';
/// PokemonError model
@JsonSerializable()
class PokemonError implements Exception{
  final String message;
  final String? error;

  PokemonError({required this.message, this.error});

  factory PokemonError.fromJson(Map<String, dynamic> json) {
    return PokemonError(
      message: json['message'] as String,
      error: json['error'] as String?,
    );
  }
}
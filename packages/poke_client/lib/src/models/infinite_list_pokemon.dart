
import 'package:json_annotation/json_annotation.dart';
import 'result.dart';
/// InfiniteListPokemon model
@JsonSerializable()
class InfiniteListPokemon {
  final List<Result> results;
  final String? next;
  final String? previous;

  InfiniteListPokemon({required this.results, required this.next, required this.previous});

  factory InfiniteListPokemon.fromJson(Map<String, dynamic> json) {
    return InfiniteListPokemon(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );
  }

  static final empty = InfiniteListPokemon(results: [], next: '', previous: '');

}
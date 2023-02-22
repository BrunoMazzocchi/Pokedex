part of 'pokemon_search_cubit.dart';

enum PokemonSearchStatus { initial, loading, success, error }

const $PokemonSearchStatusMap = {
  PokemonSearchStatus.initial: 'initial',
  PokemonSearchStatus.loading: 'loading',
  PokemonSearchStatus.success: 'success',
  PokemonSearchStatus.error: 'error',
};

@JsonSerializable()
class PokemonSearchState extends Equatable {
  PokemonSearchState({
    this.status = PokemonSearchStatus.initial,
    Pokemon? pokemon,
}) : pokemon = pokemon ?? Pokemon.empty;


  final PokemonSearchStatus status;
  final Pokemon pokemon;


  factory PokemonSearchState.fromJson(Map<String, dynamic> json) {
    return PokemonSearchState(
      status: $PokemonSearchStatusMap.entries
          .firstWhere((e) => e.value == json['status'])
          .key,
      pokemon: Pokemon.fromJson(json['pokemon'] as Map<String, dynamic>),
    );
  }


  PokemonSearchState copyWith({
    PokemonSearchStatus? status,
    Pokemon? pokemon,
  }) {
    return PokemonSearchState(
      status: status ?? this.status,
      pokemon: pokemon ?? this.pokemon,
    );
  }

  @override
  List<Object?> get props => [status, pokemon];

}
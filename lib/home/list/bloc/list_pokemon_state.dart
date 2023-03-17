part of 'list_pokemon_bloc.dart';

enum ListPokemonStatus { initial, loading, success, error }

class ListPokemonState extends Equatable{
  const ListPokemonState({
    this.status = ListPokemonStatus.initial,
    this.hasReachedMax = false,
    this.pokemons =  const <Pokemon>[],
  });

  final ListPokemonStatus status;
  final List<Pokemon>  pokemons;
  final bool hasReachedMax;

  ListPokemonState copyWith({
    ListPokemonStatus? status,
    List<Pokemon>? pokemons,
    bool? hasReachedMax,
}) {
    return ListPokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }



  @override
  List<Object?> get props => [status, pokemons, hasReachedMax];

}
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_client/poke_client.dart';

part 'pokemon_search_state.dart';

class PokemonSearchCubit extends Cubit<PokemonSearchState> {
  PokemonSearchCubit(this._pokemonRepository) : super(PokemonSearchState());

  final PokeRepository _pokemonRepository;

  Future<void> searchPokemon(String name) async {
    emit(state.copyWith(status: PokemonSearchStatus.loading));

    if(name.isEmpty) {
      emit(state.copyWith(status: PokemonSearchStatus.initial));
      return;
    }


    try {
        final pokemon = await _pokemonRepository.search(name);
        emit(state.copyWith(status: PokemonSearchStatus.success, pokemon: pokemon));

    } on Exception {
      emit(state.copyWith(status: PokemonSearchStatus.error));
    }
  }

}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:poke_client/poke_client.dart';

part 'list_pokemon_event.dart';

part 'list_pokemon_state.dart';

class ListPokemonBloc extends Bloc<ListPokemonEvent, ListPokemonState> {
  ListPokemonBloc({required this.httpClient, required this.repository})
      : super(const ListPokemonState()) {
    on<ListPokemonSearchAll>(_onSearchAll);
  }


  final http.Client httpClient;
  final PokeRepository repository;

  Future<void> _onSearchAll(ListPokemonSearchAll event,
      Emitter<ListPokemonState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ListPokemonStatus.initial) {
        final pokemons = await repository.searchAll();
        final pokemonList = await _getPokemonInList(pokemons, []);
        emit(state.copyWith(
          status: ListPokemonStatus.success,
          pokemons: pokemonList,
          hasReachedMax: false,
        ));
      }

      final pokemons = await repository.searchAll(state.pokemons.length);
      final pokemonList = await _getPokemonInList(pokemons, []);
      emit(pokemons.results.isEmpty
          ? state.copyWith(
              hasReachedMax: true,
            )
          : state.copyWith(
              status: ListPokemonStatus.success,
              pokemons: List.of(state.pokemons)..addAll(pokemonList),
              hasReachedMax: false,
            ));

    } catch (e) {
      emit(state.copyWith(status: ListPokemonStatus.error));
    }
  }

  Future<List<Pokemon>> _getPokemonInList(InfiniteListPokemon infiniteList,
      List<Pokemon> pokemonList) async {
    for (var i = 0; i < infiniteList.results.length; i++) {
      final pokemon = await repository.search(infiniteList.results[i].name);
      pokemonList.add(pokemon);
    }

    return pokemonList;
  }


}
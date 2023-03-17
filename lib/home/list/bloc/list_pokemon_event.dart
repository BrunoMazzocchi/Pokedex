part of 'list_pokemon_bloc.dart';

abstract  class ListPokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class  ListPokemonSearchAll extends ListPokemonEvent {}
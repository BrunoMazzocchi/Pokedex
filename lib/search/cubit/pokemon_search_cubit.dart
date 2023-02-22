import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemon_search_state.dart';

class PokemonSearchCubit extends Cubit<PokemonSearchState> {
  PokemonSearchCubit() : super(PokemonSearchInitial());
}

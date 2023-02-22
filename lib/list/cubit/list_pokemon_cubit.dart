import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_pokemon_state.dart';

class ListPokemonCubit extends Cubit<ListPokemonState> {
  ListPokemonCubit() : super(ListPokemonInitial());
}

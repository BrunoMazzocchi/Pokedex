import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/main.dart';
import 'package:pokedex/search/cubit/pokemon_search_cubit.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({Key? key}) : super(key: key);

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}


class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _onClearTapped() {
    _textController.clear();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CupertinoTextField(
              controller: _textController,
              autocorrect: false,
              style: const TextStyle(
                color: Colors.grey,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              placeholder: "Let's look for a pokemon...",
              placeholderStyle: const TextStyle(
                color: Colors.grey,
              ),
              prefix: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              onChanged: (text) {
                if (text.isNotEmpty) {
                  context.read<PokemonSearchCubit>().searchPokemon(text);
                }
              },
              onTap: _onClearTapped,
            ),
            BlocBuilder<PokemonSearchCubit, PokemonSearchState>(
                builder: (context, state) {
                  switch (state.status) {
                    case PokemonSearchStatus.loading:
                      return const Center(child: CircularProgressIndicator());
                    case PokemonSearchStatus.success:
                      return Text(state.pokemon.name);
                    case PokemonSearchStatus.error:
                      return const Text('Error');
                    default:
                      return const Text('No pokemon found');
                  }
                })
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_client/poke_client.dart';
import 'package:pokedex/search/cubit/pokemon_search_cubit.dart';

import '../../widgets/pokemon_card.dart';

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
            const SizedBox(height: 20),
            BlocBuilder<PokemonSearchCubit, PokemonSearchState>(
                builder: (context, state) {
              switch (state.status) {
                case PokemonSearchStatus.loading:
                  return const LoadingCard();
                case PokemonSearchStatus.success:
                  return PokemonCard(pokemon: state.pokemon);
                case PokemonSearchStatus.error:
                  return const NotFoundCard();
                default:
                  return const NotFoundCard();
              }
            })
          ],
        ),
      ),
    );
  }
}




class NotFoundCard extends StatelessWidget {
  const NotFoundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          "At this time we did not find your pokemon. Please check that the name or ID is correct :D",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class LoadingCard extends StatelessWidget {
  const LoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: CircularProgressIndicator(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 20,
                color: Colors.grey,
              ),
              Container(
                width: 100,
                height: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

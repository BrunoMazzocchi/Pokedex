import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/search/cubit/pokemon_search_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'components/pokemon_result_card.dart';

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
  final _node = FocusNode();
  Timer? _debounceTimer;
  String _text = '';
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


  void _onTextChanged(String text) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _text = text;
        context.read<PokemonSearchCubit>().searchPokemon(_text);

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            CupertinoTextField(
              textInputAction: TextInputAction.search,
              focusNode: _node,
              keyboardType: TextInputType.text,
              autofocus: false,
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
              placeholder: AppLocalizations.of(context)!.searchPlaceholder,
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
              suffix: GestureDetector(
                onTap: () {
                  _textController.clear();
                },
                child: const Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
            ),

              onSubmitted: (value) {
                if(_node.hasFocus) {
                  _node.unfocus();
                }
              },
              suffixMode: OverlayVisibilityMode.editing,
              onTap: _onClearTapped,
              onChanged: _onTextChanged,
            ),
            const SizedBox(height: 20),
            BlocBuilder<PokemonSearchCubit, PokemonSearchState>(
                builder: (context, state) {
              switch (state.status) {
                case PokemonSearchStatus.loading:
                  return const LoadingCard();
                case PokemonSearchStatus.success:
                  return PokemonResultCard(pokemon: state.pokemon);
                case PokemonSearchStatus.error:
                  return const NotFoundCard();
                case PokemonSearchStatus.initial:
                  return const NotSearching();
              }
            })
          ],
        ),
      ),
    );
  }
}


class NotSearching extends StatelessWidget {
  const NotSearching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child:  Center(
        child: Text(
             AppLocalizations.of(context)!.searchHint,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
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
      child: Row(
        children: [
          Container(
            width: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://i.quotev.com/f6cisvt6dqba.jpg"),
              ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 10),
            child:  SizedBox(
              width: 220,
              child: Text(
                  AppLocalizations.of(context)!.searchError,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 4,
              ),
            ),
          ),
        ],
      )
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

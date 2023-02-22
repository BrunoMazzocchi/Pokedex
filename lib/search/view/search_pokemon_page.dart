import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({Key? key}) : super(key: key);

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {

  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AppView(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(CupertinoIcons.square_list_fill),
            label: "List",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
        ],
      ),
    );
  }
}


class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {

  final _textController = TextEditingController();

  final PokeRepository _pokeRepository = PokeRepository(PokeApiClient());

  void search () async {
    final pokemon = await _pokeRepository.search(_textController.text);

    if(pokemon.id != null) {
      print(pokemon.name);
    }
    else {
      print("Pokemon not found");
    }

  }


  void _onClearTapped() {
    _textController.clear();
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
                  search();
                },
                onTap: _onClearTapped,
              ),
            ],
          ),
      ),
    );
  }
}


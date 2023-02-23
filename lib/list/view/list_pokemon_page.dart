
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bloc/list_pokemon_bloc.dart';

class ListPokemonPage extends StatefulWidget {
  const ListPokemonPage({Key? key}) : super(key: key);

  @override
  State<ListPokemonPage> createState() => _ListPokemonPageState();
}

class _ListPokemonPageState extends State<ListPokemonPage> {

  final _scrollController  = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }
  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
    ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<ListPokemonBloc>().add(ListPokemonSearchAll());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ListPokemonBloc, ListPokemonState>(
      builder: (context, state) {
        switch(state.status) {
          case ListPokemonStatus.initial:
            return Center(child: Text(AppLocalizations.of(context)!.loading));
          case ListPokemonStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ListPokemonStatus.success:
            return  ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.pokemons.length
                  : state.pokemons.length + 1,
              itemBuilder: (context, index) {
                return index >= state.pokemons.length
                    ? const Center(child: CircularProgressIndicator())
                    : ListTile(
                  title: PokemonCard(pokemon: state.pokemons[index]),
                );
              },
            );
          case ListPokemonStatus.error:
            return  Center(child: Text(AppLocalizations.of(context)!.error));
        }
      }
    );
  }
}

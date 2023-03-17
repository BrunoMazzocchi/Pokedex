
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/list_pokemon_bloc.dart';
import '../../../list/view/components/pokemon_card.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  final _scrollController = ScrollController();




  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
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
    return Expanded(
      child: BlocBuilder<ListPokemonBloc, ListPokemonState>(
          builder: (context, state) {
            switch (state.status) {
              case ListPokemonStatus.initial:
                return Center(
                    child: Text(AppLocalizations.of(context)!.loading));
              case ListPokemonStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListPokemonStatus.success:
                return Container(
                  color: Colors.white60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      controller: _scrollController,
                      itemCount: state.hasReachedMax
                          ? state.pokemons.length
                          : state.pokemons.length + 1,
                      itemBuilder: (context, index) {
                        return index >= state.pokemons.length
                            ? const Center(child: CircularProgressIndicator())
                            : ListTile(
                          title:
                          PokemonCard(pokemon: state.pokemons[index]),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 15,
                      ),
                    ),
                  ),
                );
              case ListPokemonStatus.error:
                return Center(child: Text(AppLocalizations.of(context)!.error));
            }
          }),
    );
  }
}

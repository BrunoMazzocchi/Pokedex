import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';

import '../../../../constants.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  late String type;
  late String name;
  late String id;

  @override
  void initState() {
    super.initState();
    type = widget.pokemon.types
        .where((element) => element.slot == 1)
        .first
        .type
        .name
        .replaceFirst(
            widget.pokemon.types
                .where((element) => element.slot == 1)
                .first
                .type
                .name[0],
            widget.pokemon.types
                .where((element) => element.slot == 1)
                .first
                .type
                .name[0]
                .toUpperCase());
    name = widget.pokemon.name.replaceFirst(
        widget.pokemon.name[0], widget.pokemon.name[0].toUpperCase());
    id = widget.pokemon.id.toString().padLeft(3, '0');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              color: color(type)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Hero(
                tag: widget.pokemon.id,
                child: Container(
                  child: Image.network(
                    "$imageUrl${widget.pokemon.id}.png",
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Rajdhani',
                        color: Colors.deepPurple),

                  ),
                  Text(
                    id,
                    style: TextStyle(
                        fontFamily: 'Rajdhani',
                        fontWeight: FontWeight.normal, color: Colors.deepPurple),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.pushNamed(context, "/open_pokemon",
              arguments: widget.pokemon);
        });
  }
}

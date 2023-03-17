
import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../constants.dart';
import '../../../../widgets/type_icon.dart';


class PokemonResultCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonResultCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonResultCard> createState() => _PokemonResultCardState();
}

class _PokemonResultCardState extends State<PokemonResultCard> {
  late double width = MediaQuery
      .of(context)
      .size
      .width;
  late double height = MediaQuery
      .of(context)
      .size
      .height;
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
          height: 150,
          width: MediaQuery.of(context).size.width * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              color: color(type)),
          child: Row(
            children: [
              Hero(
                tag: widget.pokemon.id,
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    "$imageUrl${widget.pokemon.id}.png",
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            fontFamily: 'Rajdhani'),
                      ),
                      Text(
                        "#$id",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            fontFamily: 'Rajdhani'),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      TypeIcon(
                        type: widget.pokemon.types
                            .where((element) => element.slot == 1)
                            .first
                            .type
                            .name,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TypeIcon(
                        type: widget.pokemon.types
                            .where((element) => element.slot == 2)
                            .first
                            .type
                            .name,
                      ),
                    ],
                  ),
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
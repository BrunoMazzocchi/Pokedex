import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';

import '../../../constants.dart';
import '../../../widgets/type_icon.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
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
    return InkWell(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: width * 0.45,
              height: height * 0.2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "#$id",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TypeIcon(type: type),
                      Hero(
                          tag:  widget.pokemon.id,
                          child: Image.network(
                            "$imageUrl${widget.pokemon.id}.png",
                            height: 50,
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Image.network(pokeballImage,
                  height: 50, width: 50, color: Colors.grey.withOpacity(0.3)),
            )
          ],
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
          Navigator.pushNamed(context, "/open_pokemon",
              arguments: widget.pokemon);
        });
  }
}

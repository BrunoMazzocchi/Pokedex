import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';

import '../constants.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}
class _PokemonCardState extends State<PokemonCard> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        height: 120,
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network("$imageUrl${widget.pokemon.id}.png"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pokemon name: ${widget.pokemon.name}"),
                Text("Pokemon id: ${widget.pokemon.id}"),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/open_pokemon",
            arguments: widget.pokemon);
      }
    );
  }
}
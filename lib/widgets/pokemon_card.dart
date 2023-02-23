import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';

import '../constants.dart';
import 'type_icon.dart';

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

  @override
  void initState() {
    type = widget.pokemon.types.where((element) => element.slot == 1).first.type.name.replaceFirst(widget.pokemon.types.where((element) => element.slot == 1).first.type.name[0], widget.pokemon.types.where((element) => element.slot == 1).first.type.name[0].toUpperCase());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
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
                  blurRadius: 2,
                  offset: Offset(0, 3),
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
                    Text("Name: ${widget.pokemon.name.replaceFirst(widget.pokemon.name[0], widget.pokemon.name[0].toUpperCase())}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Pokedex #${widget.pokemon.id}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),),
                        const SizedBox(
                          width: 20,
                        ),
                        TypeIcon(type: type),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Image.network(pokeballImage,
                height: 50,
                width: 50,
                color: Colors.grey.withOpacity(0.3)),
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, "/open_pokemon",
            arguments: widget.pokemon);
      }
    );
  }
}


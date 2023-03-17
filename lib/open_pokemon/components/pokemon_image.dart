
import 'package:flutter/material.dart';

import '../../constants.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({Key? key, required this.type, required this.id}) : super(key: key);

  final String type;
  final int id;
  @override
  Widget build(BuildContext context) {
    final size  =  MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.45,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: color(type),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Hero(
          tag: id,
          child: Image.network(
            "$imageUrl${id}.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

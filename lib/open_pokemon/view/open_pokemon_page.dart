import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';

import '../../constants.dart';
import '../components/categories.dart';
import '../components/pokemon_image.dart';

class OpenPokemonPage extends StatefulWidget {
  final Pokemon pokemon;

  const OpenPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<OpenPokemonPage> createState() => _OpenPokemonPageState();
}

class _OpenPokemonPageState extends State<OpenPokemonPage> {
  late Widget current;
  late String type;
  late String name;
  late String id;

  @override
  void initState() {
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
    name = widget.pokemon.name.toUpperCase();
    color(type);
    id = widget.pokemon.id.toString().padLeft(3, '0');
    super.initState();
  }

  void changeCurrent(Widget widget) {
    setState(() {
      current = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white60,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: RichText(
          text: TextSpan(
            text: "${name}\n",
            style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rajdhani'),
            children: <TextSpan>[
              TextSpan(
                text: '$id',
                style: const TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Rajdhani'),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white60,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
          child: Column(
            children: [
              PokemonImage(
                id: widget.pokemon.id,
                type: type,
              ),
              Categories(
                pokemon: widget.pokemon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';

import '../../constants.dart';

class OpenPokemonPage extends StatefulWidget {
  final Pokemon pokemon;
  const OpenPokemonPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<OpenPokemonPage> createState() => _OpenPokemonPageState();
}

class _OpenPokemonPageState extends State<OpenPokemonPage> {


  late Widget current;

  @override
  void initState() {
    current = const About();
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
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
            image: NetworkImage(pokeballImage),
          ),
        ),
        child:  Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: width,
              height: height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "$imageUrl${widget.pokemon.id}.png",
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.pokemon.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Type: Fire",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Pokedex #${widget.pokemon.id}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          InkWell(
                            onTap: () {
                              changeCurrent(const About());
                            },
                            child: const Text(
                              "About",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              changeCurrent(const Abilities());
                            },
                            child: const Text(
                              "Abilities",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              changeCurrent(const Moves());
                            },
                            child: const Text(
                              "Moves",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                       Expanded(
                        child: current,
                      ),
                    ],
                  ),

                )
              ],
            ),
            Positioned(
              top: 50,
              left: 20,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: Center(
        child: Text(
          "About",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Abilities extends StatelessWidget {
  const Abilities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: Center(
        child: Text(
          "Abilities",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Moves extends StatelessWidget {
  const Moves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: Center(
        child: Text(
          "Moves",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
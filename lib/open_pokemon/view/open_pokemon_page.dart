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
    current = About(pokemon: widget.pokemon);
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
                SizedBox(
                  height: 500,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          InkWell(
                            onTap: () {
                              changeCurrent(About(pokemon: widget.pokemon));
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
                              changeCurrent(Abilities(pokemon: widget.pokemon));
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
                              changeCurrent(Moves(pokemon: widget.pokemon));
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
  final Pokemon pokemon;
  const About({Key? key, required this.pokemon}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(20),
      width: width,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Height: ${pokemon.height} m',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Weight: ${pokemon.weight} lbs',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Base Experience: ${pokemon.baseExperience}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Evolution: ${pokemon.order}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    );
  }
}

class Abilities extends StatelessWidget {
  final Pokemon pokemon;
  const Abilities({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: 400,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: pokemon.abilities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Ability# ${index + 1} ${pokemon.abilities[index].ability.name.toUpperCase()}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Moves extends StatelessWidget {
  final Pokemon pokemon;
  const Moves({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      height: 400,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: pokemon.moves.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "Move# ${index + 1} ${pokemon.moves[index].move.name.toUpperCase()}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
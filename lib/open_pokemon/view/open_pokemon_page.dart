import 'package:flutter/material.dart';
import 'package:poke_client/poke_client.dart';
import 'package:pokedex/widgets/type_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constants.dart';

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

  @override
  void initState() {
    current = About(pokemon: widget.pokemon);
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
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color(type),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Hero(
                      tag:  widget.pokemon.id,
                      child: Image.network(
                        "$imageUrl${widget.pokemon.id}.png",
                        height: 200,
                      )
                    ),
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    TypeIcon(
                      type: type,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    "#${widget.pokemon.id}",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              changeCurrent(About(pokemon: widget.pokemon));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.about.toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                color: current == About(pokemon: widget.pokemon)
                                    ? Colors.black
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              changeCurrent(Abilities(pokemon: widget.pokemon));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.abilities.toUpperCase(),
                              style: TextStyle(
                                color: current ==
                                        Abilities(pokemon: widget.pokemon)
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              changeCurrent(Moves(pokemon: widget.pokemon));
                            },
                            child: Text(
                              AppLocalizations.of(context)!.moves.toUpperCase(),
                              style: TextStyle(
                                color: current == Moves(pokemon: widget.pokemon)
                                    ? Colors.black
                                    : Colors.grey,
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
            Row(
              children: [
                 Text(
                  "${AppLocalizations.of(context)!.height}: ",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${pokemon.height} m',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                 Text(
                  "${AppLocalizations.of(context)!.weight}: ",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${pokemon.weight} lbs',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                 Text(
                  "${AppLocalizations.of(context)!.base_experience}: ",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${pokemon.baseExperience}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              children: [
                 Text(
                  "${AppLocalizations.of(context)!.evolution}: ",
                  style: const TextStyle(
                    color:  Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${pokemon.order}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: pokemon.types.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TypeIcon(
                    type: pokemon.types[index].type.name.toUpperCase(),
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class Abilities extends StatelessWidget {
  final Pokemon pokemon;

  const Abilities({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            "${AppLocalizations.of(context)!.abilities_now}: ${pokemon.abilities.length}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: width,
            height: 300,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: pokemon.abilities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${index + 1}. ${pokemon.abilities[index].ability.name.toUpperCase()}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text(
            "${AppLocalizations.of(context)!.moves_now}: ${pokemon.moves.length}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: width,
            height: 300,
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: pokemon.moves.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding (
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${index + 1}. ${pokemon.moves[index].move.name.toUpperCase()}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

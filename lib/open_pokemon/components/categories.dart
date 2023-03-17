import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:poke_client/poke_client.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key, required this.pokemon}) : super(key: key);
  final Pokemon pokemon;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "Details",
    "Abilities",
    "Moves",
    "Types",
  ];

  late List<Widget> data;
  int selectedIndex = 0;

  @override
  void initState() {

    Widget details = Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ID: ${widget.pokemon.id}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: "Rajdhani"
              )),
          Text("Name: ${widget.pokemon.name}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: "Rajdhani"
              )),
          Text("Height: ${widget.pokemon.height}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: "Rajdhani"
              )),
          Text("Weight: ${widget.pokemon.weight}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: "Rajdhani"
              )),
          Text("Base Experience: ${widget.pokemon.baseExperience}",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontFamily: "Rajdhani"
              )),
        ],
      ),
    );
    Widget abilities = Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "${Abilities}: ${widget.pokemon.abilities.length}",
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: "Rajdhani"
            )),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: widget.pokemon.abilities.length,
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
                          "${index + 1}. ${widget.pokemon.abilities[index].ability.name.toUpperCase()}",
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
            ),
          ],
        ),
      ),
    );
    Widget moves = Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "${Moves}: ${widget.pokemon.moves.length}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontFamily: "Rajdhani"
                )),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: widget.pokemon.moves.length,
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
                          "${index + 1}. ${widget.pokemon.moves[index].move.name.toUpperCase()}",
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
            ),
          ],
        ),
      ),
    );
    Widget types = Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Types: ${widget.pokemon.types.length}",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontFamily: "Rajdhani"
                )),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: widget.pokemon.types.length,
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
                          "${index + 1}. ${widget.pokemon.types[index].type.name.toUpperCase()}",
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
            ),
          ],
        ),
      ),
    );


    data = [
      details,

      abilities,
      moves,
     types,
    ];
    super.initState();
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Rajdhani',
                color: selectedIndex == index
                    ? Colors.deepPurple
                    : Colors.deepPurple[100],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: (20 / 4)),
                height: 2,
                width: 30,
                color: selectedIndex == index
                    ? Colors.deepPurple
                    : Colors.transparent)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: height * 0.35,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: height * 0.05,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => buildCategory(index))),
            Container(height: height * 0.3, child: data[selectedIndex]),
          ],
        ),
      ),
    );
  }
}

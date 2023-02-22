
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search/view/search_pokemon_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PokemonAppView();
  }
}


class PokemonAppView extends StatelessWidget {
  const PokemonAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );


    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme:  GoogleFonts.rajdhaniTextTheme(),
      ),
      home: const SearchPokemonPage(),
    );
  }
}

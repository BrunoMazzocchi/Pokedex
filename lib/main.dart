import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:poke_client/poke_client.dart';

import 'home/list/bloc/list_pokemon_bloc.dart';
import 'home/list/view/list_screen.dart';
import 'home/search/cubit/pokemon_search_cubit.dart';
import 'open_pokemon/view/open_pokemon_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const App()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              PokemonSearchCubit(PokeRepository(PokeApiClient())),
          child: const PokemonAppView(),
        ),
        BlocProvider(
            create: (context) => ListPokemonBloc(
                httpClient: http.Client(),
                repository: PokeRepository(PokeApiClient()))
              ..add(ListPokemonSearchAll()))
      ],
      child: const PokemonAppView(),
    );
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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        "/open_pokemon": (context) {
          final Pokemon pokemon = ModalRoute.of(context)!.settings.arguments as Pokemon;
          return OpenPokemonPage(pokemon: pokemon);
        }
      },
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.rajdhaniTextTheme(),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white60,
        title: Text(AppLocalizations.of(context)!.pokedex,
        style: const TextStyle(
          color: Colors.deepPurple,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontFamily: 'Rajdhani',
        ),),
      ),
      body: SafeArea(
        child: ListScreen(),
      ),
    );
  }
}

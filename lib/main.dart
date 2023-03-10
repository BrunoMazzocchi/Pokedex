import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:poke_client/poke_client.dart';
import 'package:pokedex/list/view/list_pokemon_page.dart';
import 'package:pokedex/search/cubit/pokemon_search_cubit.dart';

import 'list/bloc/list_pokemon_bloc.dart';
import 'open_pokemon/view/open_pokemon_page.dart';
import 'search/view/search_pokemon_page.dart';
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
      home: const NavigationController(),
    );
  }
}

class NavigationController extends StatefulWidget {
  const NavigationController({Key? key}) : super(key: key);

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(AppLocalizations.of(context)!.pokedex,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          ListPokemonPage(),
          SearchPokemonPage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations:  <Widget>[
          NavigationDestination(
            icon: const Icon(CupertinoIcons.square_list_fill),
            label:  AppLocalizations.of(context)!.list,
          ),
          NavigationDestination(
            icon: const  Icon(CupertinoIcons.search),
            label: AppLocalizations.of(context)!.search,
          ),
        ],
      ),
    );
  }
}

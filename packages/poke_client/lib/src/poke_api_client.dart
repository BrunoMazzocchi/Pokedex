import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/models.dart';

/// A client for the PokeAPI
class PokeApiClient {
  PokeApiClient({
    http.Client? httpClient,
     this.baseUrl = 'https://pokeapi.co/api/v2/pokemon',
}): this.httpClient = httpClient ?? http.Client();


  final String baseUrl;
  final http.Client httpClient;

  Future<Pokemon> search(String path) async {
    final response = await httpClient.get(Uri.parse('/$baseUrl$path'));
    if (response.statusCode == 200) {
      final pokemon = json.decode(response.body) as Map<String, dynamic>;
      return Pokemon.fromJson(pokemon);
    } else {
      throw Exception('error getting $path');
    }
  }
}
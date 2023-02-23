

import 'package:flutter/material.dart';

const String imageUrl =
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/";
const String pokeballImage = "https://cdn2.iconfinder.com/data/icons/gaming-stroke-icons/104/22-gaming-pokemon-pokeball-512.png";

Color color (String colorByType) {
  switch(colorByType.toLowerCase()) {
    case "normal":
      return Colors.brown;
    case "fire":
      return Colors.redAccent;
    case "water":
      return Colors.blue;
    case "electric":
      return Colors.yellow;
    case "grass":
      return Colors.green;
    case "ice":
      return Colors.lightBlueAccent;
    case "fighting":
      return Colors.orange;
    case "poison":
      return Colors.purple;
    case "ground":
      return Colors.brown;
    case "flying":
      return Colors.blueGrey;
    case "psychic":
      return Colors.pink;
    case "bug":
      return Colors.lightGreen;
    case "rock":
      return Colors.brown;
    case "ghost":
      return Colors.deepPurple;
    case "dragon":
      return Colors.deepOrange;
    case "dark":
      return Colors.black;
    case "steel":
      return Colors.grey;
    case "fairy":
      return Colors.pinkAccent;
    default:
      return Colors.white;
  }
}
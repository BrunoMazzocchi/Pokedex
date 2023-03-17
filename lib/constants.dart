

import 'package:flutter/material.dart';

const String imageUrl =
    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/";
const String pokeballImage = "https://cdn2.iconfinder.com/data/icons/gaming-stroke-icons/104/22-gaming-pokemon-pokeball-512.png";

Color? color (String colorByType) {
  switch(colorByType.toLowerCase()) {
    case "normal":
      return Colors.brown[100];
    case "fire":
      return Colors.orange[100];
    case "water":
      return Colors.blue[100];
    case "electric":
      return Colors.yellow[100];
    case "grass":
      return Colors.green[100];
    case "ice":
      return Colors.lightBlueAccent[100];
    case "fighting":
      return Colors.orange[100];
    case "poison":
      return Colors.purple[100];
    case "ground":
      return Colors.brown[300];
    case "flying":
      return Colors.blueGrey[100];
    case "psychic":
      return Colors.pink[100];
    case "bug":
      return Colors.lightGreen[100];
    case "rock":
      return Colors.brown[100];
    case "ghost":
      return Colors.deepPurple[100];
    case "dragon":
      return Colors.deepOrange[100];
    case "dark":
      return Colors.deepPurple[300];
    case "steel":
      return Colors.grey;
    case "fairy":
      return Colors.pinkAccent[100];
    default:
      return Colors.white;
  }
}
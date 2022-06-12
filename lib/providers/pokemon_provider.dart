import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sprout_app/models/pokemon_model.dart';
import 'package:sprout_app/models/pokemon_name_model.dart';

class PokemonProvider extends ChangeNotifier{
  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => _pokemons;

  List<PokemonName> _pokemonNames = [];
  List<PokemonName> get pokemonNames => _pokemonNames;

  String _nextUrls = '';
  String get nextUrls => _nextUrls;

  PokemonProvider(){
    init();
  }

  init() async {
    try{
      await getPokemonName();
      await getPokemonDetail();
      await getNextUrl();
    } catch(e) {
      print(e);
    }
  }

  getPokemonName() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    _pokemonNames = (json.decode(response.body)['results'] as List)
    .map((e) => PokemonName.fromJson(e))
    .toList();

    notifyListeners();
  }

  getNextUrl() async {
    final respnse = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    final data = NextUrl.fromJson(jsonDecode(respnse.body));

    _nextUrls = data.next;
    notifyListeners();
  }

  getMorePokemon(String url) async {
    final response = await http.get(Uri.parse(url));

    final data = PokemonName.fromJson(jsonDecode(response.body));

    _pokemonNames = (json.decode(response.body)['results'] as List)
    .map((e) => PokemonName.fromJson(e))
    .toList();

    notifyListeners();
  }

  getPokemonDetail() async {
    for (var pokemon in _pokemonNames) {
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/'+pokemon.name));

      final data = Pokemon.fromJson(json.decode(response.body));
      _pokemons.add(data);
    }
    notifyListeners();
  }

}
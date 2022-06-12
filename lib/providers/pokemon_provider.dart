import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sprout_app/models/pokemon_model.dart';
import 'package:sprout_app/models/pokemon_name_model.dart';

class PokemonProvider extends ChangeNotifier {
  List<Pokemon> _pokemons = [];
  List<Pokemon> get pokemons => _pokemons;

  List<PokemonName> _pokemonNames = [];
  List<PokemonName> get pokemonNames => _pokemonNames;

  String _nextUrls = '';
  String get nextUrls => _nextUrls;

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  PokemonProvider() {
    init();
  }

  init() async {
    try {
      await getPokemonName();
      await getFirstPokemonDetail();
      await getNextUrl();
    } catch (e) {
      print(e);
    }
  }

  getPokemonName() async {
    final response =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    _pokemonNames = (json.decode(response.body)['results'] as List)
        .map((e) => PokemonName.fromJson(e))
        .toList();

    notifyListeners();
  }

  getNextUrl() async {
    final respnse =
        await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    final data = NextUrl.fromJson(jsonDecode(respnse.body));

    _nextUrls = data.next;
    notifyListeners();
  }

  getMorePokemon(String url) async {
    _isFetching = true;
    try {
      final response = await http.get(Uri.parse(url));

      List<PokemonName> names = (json.decode(response.body)['results'] as List)
          .map((e) => PokemonName.fromJson(e))
          .toList();
      _nextUrls = json.decode(response.body)['next'].toString();

      _pokemonNames.addAll(names);
      await getNextPokemonDetail(names);

    } catch (e) {
      print('gagal get more : $e');
    }

    print('masuk sini');
    _isFetching = false;
    notifyListeners();
  }

  getFirstPokemonDetail() async {
    for (var pokemon in _pokemonNames) {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/' + pokemon.name));

      final data = Pokemon.fromJson(json.decode(response.body));
      _pokemons.add(data);
    }
    notifyListeners();
  }

  getNextPokemonDetail(List<PokemonName> names) async {
    for (var pokemon in names) {
      final response = await http
          .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/' + pokemon.name));

      final data = Pokemon.fromJson(json.decode(response.body));
      _pokemons.add(data);
    }
    notifyListeners();
  }
}

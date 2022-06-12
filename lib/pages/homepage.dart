import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sprout_app/providers/pokemon_provider.dart';
import 'package:sprout_app/pages/pokemon_detail_page.dart';
import 'package:sprout_app/widgets/pokemon_grid_widget.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokemonData = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Poke Dex'),
      ),
      body: PokemonGridWidget()
    );
  }
}

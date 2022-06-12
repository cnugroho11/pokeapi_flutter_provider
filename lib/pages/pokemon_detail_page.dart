import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:sprout_app/constants/theme.dart';
import 'package:sprout_app/providers/pokemon_provider.dart';
import 'package:sprout_app/widgets/pokemon_ability_bar_widget.dart';
import 'package:sprout_app/widgets/pokemon_ability_widget.dart';
import 'package:sprout_app/widgets/pokemon_type_widget.dart';
import 'package:sprout_app/constants/utils.dart';

class PokemonDetailPage extends StatelessWidget {
  String name;

  PokemonDetailPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final pokemonData = Provider.of<PokemonProvider>(context)
        .pokemons
        .firstWhere((a) => a.name == name);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
      ),
      body: Container(
        color:
            getPokemonTypeColor(pokemonData.type[0].type.name).withAlpha(170),
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  pokemonData.name,
                  style: TextStyle(
                      fontSize: sizeHorizontal * 9,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    ...pokemonData.type
                        .map((e) => PokemonTypeWidget(type: e.type.name))
                        .toList()
                  ],
                ),
              ),
              Center(
                child: Container(
                  child: CachedNetworkImage(
                    height: sizeHorizontal * 65,
                    width: sizeHorizontal * 65,
                    imageUrl: pokemonData.image,
                    progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: const TabBar(
                    labelColor: Colors.blue,
                    tabs: [
                      Tab(
                        text: 'About',
                      ),
                      Tab(
                        text: 'Base Stat',
                      ),
                    ],
                  )),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Height ',
                                style: TextStyle(fontSize: sizeHorizontal * 4),
                              ),
                              Text(
                                pokemonData.height.toString() + ' cm',
                                style: TextStyle(fontSize: sizeHorizontal * 4),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Height ',
                                style: TextStyle(fontSize: sizeHorizontal * 4),
                              ),
                              Text(
                                pokemonData.weight.toString() + ' kg',
                                style: TextStyle(fontSize: sizeHorizontal * 4),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  'Ability ',
                                  style:
                                      TextStyle(fontSize: sizeHorizontal * 4),
                                ),
                              ),
                              Row(
                                  children: pokemonData.ability
                                      .map((e) => PokemonAbilityWidget(
                                          ability: e.ability.name))
                                      .toList())
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hp',
                                  style:
                                      TextStyle(fontSize: sizeHorizontal * 4),
                                ),
                                Text(
                                  'Attack',
                                  style:
                                      TextStyle(fontSize: sizeHorizontal * 4),
                                ),
                                Text(
                                  'Defence',
                                  style:
                                      TextStyle(fontSize: sizeHorizontal * 4),
                                ),
                                Text(
                                  'Special-attack',
                                  style:
                                      TextStyle(fontSize: sizeHorizontal * 4),
                                ),
                                Text(
                                  'Special-defense',
                                  style:
                                      TextStyle(fontSize: sizeHorizontal * 4),
                                ),
                                Text(
                                  'Speed',
                                  style:
                                      TextStyle(fontSize: sizeHorizontal * 4),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: pokemonData.stat
                                      .map((e) => Text(
                                            e.baseStat.toString(),
                                            style: TextStyle(
                                                fontSize: sizeHorizontal * 4),
                                          ))
                                      .toList(),
                                ),
                                SizedBox(width: sizeHorizontal * 3,),
                                Column(children: [
                                  SizedBox(
                                    height: sizeHorizontal * 1.5,
                                  ),
                                  ...pokemonData.stat
                                      .map((e) => PokemonAbilityBarWidget(
                                          stat: e.baseStat))
                                      .toList()
                                ])
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:sprout_app/providers/pokemon_provider.dart';
import 'package:sprout_app/constants/theme.dart';
import 'package:sprout_app/pages/pokemon_detail_page.dart';
import 'package:sprout_app/widgets/pokemon_type_widget.dart';
import 'package:sprout_app/constants/utils.dart';

class PokemonGridWidget extends StatelessWidget {
  const PokemonGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    final pokemonData = Provider.of<PokemonProvider>(context);

    final pokemonName = pokemonData.pokemonNames;
    final pokemonDetail = pokemonData.pokemons;

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollEndNotification &&
            scrollNotification.metrics.extentAfter == 0 && !pokemonData.isFetching) {
          pokemonData.getMorePokemon(pokemonData.nextUrls);
          print(pokemonData.nextUrls);
          print('habis');
          return true;
        }
        return false;
      },
      child: GridView.builder(
        padding: EdgeInsets.only(left: 10, right: 10, top: sizeVertical * 2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 4,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 1),
        itemCount: pokemonDetail.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      PokemonDetailPage(name: pokemonName[index].name)));
            },
            child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                    color: getPokemonTypeColor(
                            pokemonDetail[index].type[0].type.name)
                        .withAlpha(170),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: sizeVertical * 5,
                        ),
                        Text(
                          pokemonDetail[index].name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: sizeHorizontal * 4,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        ...pokemonDetail[index]
                            .type
                            .map((e) => PokemonTypeWidget(type: e.type.name))
                            .toList(),
                      ],
                    ),
                    Container(
                      height: sizeHorizontal * 21,
                      width: sizeHorizontal * 21,
                      child: CachedNetworkImage(
                        imageUrl: pokemonDetail[index].image,
                        progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      )
                          // Image.network(pokemonDetail[index].image, scale: 6),
                    )
                  ],
                )),
          );
        },
      ),
    );
  }
}

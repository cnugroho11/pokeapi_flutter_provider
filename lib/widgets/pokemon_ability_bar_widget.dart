import 'package:flutter/material.dart';

class PokemonAbilityBarWidget extends StatelessWidget {
  int stat;

  PokemonAbilityBarWidget({Key? key, required this.stat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          Container(
            height: 4,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
          Container(
            height: 4,
            width: (100 * stat) / 250 ,
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          )
        ],
      ),
    );
  }
}

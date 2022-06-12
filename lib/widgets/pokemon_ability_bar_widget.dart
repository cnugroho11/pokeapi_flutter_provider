import 'package:flutter/material.dart';

class PokemonAbilityBarWidget extends StatelessWidget {
  int stat;

  PokemonAbilityBarWidget({Key? key, required this.stat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 4,
          width: 100,
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
        ),
        Container(
          height: 4,
          width: stat.toDouble(),
          decoration: const BoxDecoration(color: Colors.lightGreen),
        )
      ],
    );
  }
}

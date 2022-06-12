import 'package:flutter/material.dart';
import 'package:sprout_app/constants/theme.dart';


class PokemonAbilityWidget extends StatelessWidget {
  String ability;

  PokemonAbilityWidget({Key? key, required this.ability}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 6),
      height: sizeVertical * 4,
      width: sizeHorizontal * 25,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(child: Text(ability)),
    );
  }
}
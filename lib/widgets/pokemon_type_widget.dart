import 'package:flutter/material.dart';

import 'package:sprout_app/constants/theme.dart';
import 'package:sprout_app/constants/utils.dart';

class PokemonTypeWidget extends StatelessWidget {
  String type;

  PokemonTypeWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 6),
      height: sizeVertical * 4,
      width: sizeHorizontal * 20,
      decoration: BoxDecoration(
        color: getPokemonTypeColor(type),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Text(
          type,
          style: TextStyle(
            color: Colors.white
          ),
        )
      ),
    );
  }
}
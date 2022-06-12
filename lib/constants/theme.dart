import 'package:flutter/widgets.dart';

//USER INFO
late int userId;
late double sizeHorizontal;
late double sizeVertical;
late double pix;

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
    sizeHorizontal = safeBlockHorizontal;
    sizeVertical = safeBlockVertical;
    pix = (sizeVertical + sizeHorizontal) / 2;
  }
}

const cGreenGrass = Color(0xFF78C850);
const cPurplePoison = Color(0xFFA040A0);
const cOrangeFire = Color(0xFFF08030);
const cBlueFlying = Color(0xFFA890F0);
const cBlueWater = Color(0xFF6890F0);
const cGreenBug = Color(0xFFA8B820);
const cGreyNormal = Color(0xFFA8A878);
const cBlackDark = Color(0xFF705848);
const cYellowElectric = Color(0xFFF8D030);
const cPinkPsychic = Color(0xFFF85888);
const cBlueIce = Color(0xFF98D8D8);
const cBrownGround = Color(0xFFE0C068);
const cGreySteel = Color(0xFFB8B8D0);
const cRedFighting = Color(0xFFC03028);
const cBrownRock = Color(0xFFB8A038);
const cBlueDragon = Color(0xFF7038F8);
const cBlueGhost = Color(0xFF705898);
const cPinkFairy = Color(0xFFEE99AC);
const cGreyUnknown = Color(0xFF68A090);

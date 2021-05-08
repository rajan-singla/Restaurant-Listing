import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_listings/DeviceType/device_type.dart';

import 'different_sizes.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double screenFullHeight;
  static double screenFullWidth;
  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;
  // static MediaQueryData mediaQueryData;
  // static var orientationType;

  void init(BoxConstraints constraints, Orientation orientation,MediaQueryData allMediaQueryData) {
    // DifferentSizes(mediaQueryData: allMediaQueryData);
    // mediaQueryData = allMediaQueryData;
    // orientationType = getDeviceType(allMediaQueryData);

    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      screenFullHeight = constraints.maxHeight;
      screenFullWidth = _screenWidth;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      screenFullHeight = constraints.maxWidth;
      screenFullWidth = _screenWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    print("Screen Width :: " + _screenWidth.toString());
    print("Screen Width Multiplier :: " + widthMultiplier.toString());
    print("Screen Height :: " + _screenHeight.toString());
    print("Screen Height Multiplier :: " + heightMultiplier.toString());
    print("Screen With Height Multiplier :: " + textMultiplier.toString());
    print("Screen With Image Horizontal Multiplier :: " + imageSizeMultiplier.toString());
    print("Screen Full height is : " + screenFullHeight.toString());
    print("Screen Full width is : " + screenFullWidth.toString());
  //  print(mediaQueryData.size);
  }
}
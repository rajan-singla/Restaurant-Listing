import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:restaurant_listings/MediaQueryClasses/size_config.dart';

Widget circularIndicatorWithScaffold() {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    ),
  );
}

Widget circularIndicatorWithoutScaffold() {
  return Container(
    alignment: Alignment.center,
    child: CircularProgressIndicator(),
  );
}

Widget errorScreen() {
  return Scaffold(
    body: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Image.asset(
          "assets/connection_lost.png",
          fit: BoxFit.contain,
          width: SizeConfig.screenFullWidth,
          height: SizeConfig.screenFullHeight / 2,
        )),
        Spacer(),
        Flexible(
            child: Text(
                "Please check your internet connection or try again later")),
      ],
    ),
  );
}

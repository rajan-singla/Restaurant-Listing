import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:restaurant_listings/Models/restaurant_model.dart';
import 'package:restaurant_listings/providers/home_provider.dart';
import 'package:restaurant_listings/ui_screens/bottom_navigation.dart';

void main() {
  //runApp(DevicePreview(builder: (context) =>  MyApp(),));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            //builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: 'Restaurant Listings',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home:BottomNavigation(),
          ),
        );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<HomeDataProvider>(create: (_) => HomeDataProvider()),
];

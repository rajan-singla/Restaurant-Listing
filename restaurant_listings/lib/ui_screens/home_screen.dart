//import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/ui_screens/restaurant_containers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> carouselImages = [
    Image.asset("assets/pic1.jpg", fit: BoxFit.cover),
    Image.asset(
      "assets/pic2.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/pic3.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/pic4.jpg",
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/pic5.jpg",
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[700],
        bottom: PreferredSize(
          preferredSize: Size.copy(Size.fromHeight(10.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: Text(
                    "hi, vivenna",
                    style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 1.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 15.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Disneyland naheim, California",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ],
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                          onPressed: null),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 200.0,
            width: size.width,
            child: CarouselSlider(
              items: carouselImages,
              options: CarouselOptions(
                reverse: false,
                scrollDirection: Axis.horizontal,
                disableCenter: true,
                autoPlay: true,
                pauseAutoPlayOnTouch: true,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              "Trending Restaurants",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
          RestaurantContainers(),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Text(
              "Nearby Restaurants",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ),
          RestaurantContainers(),
        ],
      ),
    );
  }
}

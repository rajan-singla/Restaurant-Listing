import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_listings/MediaQueryClasses/different_sizes.dart';
import 'package:restaurant_listings/MediaQueryClasses/size_config.dart';
import 'package:restaurant_listings/enums/device_screen_type.dart';
import 'package:restaurant_listings/ui_screens/restaurant_containers.dart';

class AboutRestaurant extends StatefulWidget {
  AboutRestaurant({Key key, this.orientationType}) : super(key: key);
  final DeviceScreenType orientationType;

  @override
  _AboutRestaurantState createState() => _AboutRestaurantState();
}

class _AboutRestaurantState extends State<AboutRestaurant> {
  @override
  Widget build(BuildContext context) {
    DeviceScreenType orientationType = widget.orientationType;

    aboutRestaurantTabsList() {
      return [
        AboutRestaurantTabs(
          tabName: "Reviews",
          widgetName: Center(
            child: Text("Reviews data will come here"),
          ),
        ),
        AboutRestaurantTabs(
          tabName: "Offers",
          widgetName: Center(
            child: Text("Offers data will come here"),
          ),
        ),
        AboutRestaurantTabs(
          tabName: "About",
          widgetName: Center(
            child: Text("About data will come here"),
          ),
        ),
      ];
    }

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: SizeConfig.screenFullHeight,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: size1_3(orientationType),
                  child: Column(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: SizeConfig.screenFullWidth,
                          child: CarouselSlider(
                            items: AllHomeImages.carouselImages,
                            options: CarouselOptions(
                              viewportFraction: 1.0,
                              reverse: false,
                              scrollDirection: Axis.horizontal,
                              disableCenter: true,
                              autoPlay: true,
                              pauseAutoPlayOnTouch: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size8(orientationType),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size16(orientationType)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'The Outlet',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: size16(orientationType),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: size2(orientationType),
                                          color: Colors.lightGreen[700]),
                                      color: Colors.lightGreen[700],
                                      borderRadius: BorderRadius.circular(
                                          size50(orientationType)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size8(orientationType),
                                          vertical: size2(orientationType)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: size15(orientationType),
                                          ),
                                          SizedBox(
                                            width: size5(orientationType),
                                          ),
                                          Text(
                                            '5.0',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          // Text(
                                          //   nearbyList[index]
                                          //       .ratingAvg
                                          //       .toString()
                                          //       .length ==
                                          //       1
                                          //       ? '${nearbyList[index].ratingAvg}.0'
                                          //       : '${nearbyList[index].ratingAvg}',
                                          //   style: TextStyle(color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Flexible(
                                child: Text(
                                  'Italian Cafe - Tabouli Mixed grilled, Hummus',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: size12(orientationType)),
                                ),
                              ),
                              SizedBox(
                                height: size8(orientationType),
                              ),
                              Flexible(
                                child: Text(
                                  r'Avg Cost - $20 for 2 people',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: size12(orientationType)),
                                ),
                              ),
                              // Text(
                              //   r'Avg Cost - $' +
                              //       nearbyList[index].avgCost +
                              //       'for 2 people',
                              //   style: TextStyle(color: Colors.black87),
                              // ),
                              SizedBox(
                                height: size8(orientationType),
                              ),
                              Flexible(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                      size: size15(orientationType),
                                    ),
                                    SizedBox(
                                      width: size5(orientationType),
                                    ),
                                    Flexible(
                                      child: Text(
                                        'nearbyList[index].address',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: size12(orientationType),
                                            color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[300],
                                thickness: 2.0,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: "Open now",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontSize: size12(orientationType)),
                                    children: [
                                      TextSpan(
                                          text: ' 11am - 11pm (Today)',
                                          style: TextStyle(color: Colors.black)),
                                    ]),
                              ),
                              SizedBox(
                                height: size4(orientationType),
                              ),
                              Text(
                                "Call: +1 9876547600",
                                style:
                                    TextStyle(fontSize: size12(orientationType)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Material(
                  child: DefaultTabController(
                    initialIndex: 0,
                    length: aboutRestaurantTabsList().length,
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey[300],
                          width: SizeConfig.screenFullWidth,
                          child: TabBar(
                            indicatorColor: Colors.green[900],
                            isScrollable: true,
                            tabs: aboutRestaurantTabsList().map((pagess) {
                              return Container(
                                width: SizeConfig.screenFullWidth / 3.9,
                                child: Tab(
                                  child: Text(
                                    pagess.tabName,
                                    style: TextStyle(
                                        fontSize: size15(orientationType),
                                        color: Colors.black),
                                  ), //18
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: aboutRestaurantTabsList().map((pagess) {
                              return Container(
                                padding: EdgeInsets.all(0.0),
                                child: pagess.widgetName,
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutRestaurantTabs {
  final String tabName;
  final Widget widgetName;

  AboutRestaurantTabs({@required this.tabName, @required this.widgetName});
}

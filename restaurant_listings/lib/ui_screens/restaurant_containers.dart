import 'package:flutter/material.dart';
import 'package:restaurant_listings/MediaQueryClasses/different_sizes.dart';
import 'package:restaurant_listings/MediaQueryClasses/size_config.dart';
import 'package:restaurant_listings/Models/home_model.dart';
import 'package:restaurant_listings/constants/constants.dart';
import 'package:restaurant_listings/enums/device_screen_type.dart';
import 'package:restaurant_listings/ui_screens/about_restaurant.dart';

class RestaurantContainers extends StatefulWidget {
  RestaurantContainers({Key key, this.nearByData, this.orientationType})
      : super(key: key);
  final List<NearBy> nearByData;
  final DeviceScreenType orientationType;

  @override
  _RestaurantContainersState createState() => _RestaurantContainersState();
}

class _RestaurantContainersState extends State<RestaurantContainers> {
  @override
  Widget build(BuildContext context) {
    List<NearBy> nearbyList = widget.nearByData;
    DeviceScreenType orientationType = widget.orientationType;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size220(orientationType),minHeight: size200(orientationType)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: nearbyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == nearbyList.length - 1
                ? EdgeInsets.fromLTRB(
                    size16(orientationType), 0, size16(orientationType), 0)
                : EdgeInsets.fromLTRB(size16(orientationType), 0, 0, 0),
            child: SizedBox(
              width: SizeConfig.screenFullWidth * 0.65,
              child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AboutRestaurant(orientationType: orientationType, restaurantId: nearbyList[index].id ))),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        width: SizeConfig.screenFullWidth * 0.65,
                        height: size120(orientationType),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(size8(orientationType)),
                          child: Image.network(
                            ConstantUrl.URL + nearbyList[index].images[0].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size8(orientationType),
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  nearbyList[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: size15(orientationType),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              FittedBox(
                                child: Container(
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
                                          nearbyList[index]
                                                      .ratingAvg
                                                      .toString()
                                                      .length ==
                                                  1
                                              ? '${nearbyList[index].ratingAvg}.0'
                                              : '${nearbyList[index].ratingAvg}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Flexible(
                            child: Text(
                              nearbyList[index].category.name,
                              style: TextStyle(color: Colors.grey,fontSize: size12(orientationType)),
                            ),
                          ),
                          SizedBox(
                            height: size8(orientationType),
                          ),
                          Flexible(
                            child: Text(
                              r'Avg Cost - $' +
                                  nearbyList[index].avgCost +
                                  ' for 2 people',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.black87,fontSize: size12(orientationType)),
                            ),
                          ),
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
                                    nearbyList[index].address,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: size12(orientationType),
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AllHomeImages {
  static List<Widget> carouselImages = [
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
}

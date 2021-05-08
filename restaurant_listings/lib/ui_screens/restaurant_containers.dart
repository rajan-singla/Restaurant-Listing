import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_listings/MediaQueryClasses/different_sizes.dart';
import 'package:restaurant_listings/MediaQueryClasses/size_config.dart';
import 'package:restaurant_listings/Models/home_model.dart';
import 'package:restaurant_listings/constants/constants.dart';
import 'package:restaurant_listings/enums/device_screen_type.dart';

class RestaurantContainers extends StatefulWidget {
  RestaurantContainers({Key key, this.nearByData, this.orientationType}) : super(key: key);
  final List<NearBy> nearByData;
  final DeviceScreenType orientationType;

  @override
  _RestaurantContainersState createState() => _RestaurantContainersState();
}

class _RestaurantContainersState extends State<RestaurantContainers> {

  @override
  Widget build(BuildContext context) {


    List<NearBy> nearbyList = widget.nearByData;

    return SizedBox(
      height: size220(widget.orientationType),
      width: SizeConfig.screenFullWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nearbyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == nearbyList.length - 1
                ? EdgeInsets.fromLTRB(size16(widget.orientationType), 0, size16(widget.orientationType), 0)
                : EdgeInsets.fromLTRB(size16(widget.orientationType), 0, 0, 0),
            child: SizedBox(
              width: SizeConfig.screenFullWidth * 0.65,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenFullWidth * 0.65,
                    height: size120(widget.orientationType),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size8(widget.orientationType)),
                      child: Image.network(
                        ConstantUrl.URL + nearbyList[index].images[0].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size8(widget.orientationType),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          nearbyList[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: size16(widget.orientationType), fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: size2(widget.orientationType), color: Colors.lightGreen[700]),
                          color: Colors.lightGreen[700],
                          borderRadius: BorderRadius.circular(size50(widget.orientationType)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size8(widget.orientationType), vertical: size2(widget.orientationType)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: size15(widget.orientationType),
                              ),
                              SizedBox(
                                width: size5(widget.orientationType),
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
                      )
                    ],
                  ),
                  Text(
                    nearbyList[index].category.name,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: size8(widget.orientationType),
                  ),
                  Text(
                    r'Avg Cost - $' +
                        nearbyList[index].avgCost +
                        'for 2 people',
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(
                    height: size8(widget.orientationType),
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: size15(widget.orientationType),
                        ),
                        SizedBox(
                          width: size5(widget.orientationType),
                        ),
                        Flexible(
                          child: Text(
                            nearbyList[index].address,
                            style:
                                TextStyle(fontSize: size12(widget.orientationType), color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class AllHomeImages {
//   static List<Widget> carouselImages = [
//     Image.asset("assets/pic1.jpg", fit: BoxFit.cover),
//     Image.asset(
//       "assets/pic2.jpg",
//       fit: BoxFit.cover,
//     ),
//     Image.asset(
//       "assets/pic3.jpg",
//       fit: BoxFit.cover,
//     ),
//     Image.asset(
//       "assets/pic4.jpg",
//       fit: BoxFit.cover,
//     ),
//     Image.asset(
//       "assets/pic5.jpg",
//       fit: BoxFit.cover,
//     ),
//   ];
// }

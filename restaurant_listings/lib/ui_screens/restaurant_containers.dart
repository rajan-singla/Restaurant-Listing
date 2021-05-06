import 'package:flutter/material.dart';
import 'package:restaurant_listings/Models/home_model.dart';
import 'package:restaurant_listings/constants/constants.dart';

class RestaurantContainers extends StatefulWidget {
  RestaurantContainers({Key key, this.nearByData}) : super(key: key);
  final List<NearBy> nearByData;

  @override
  _RestaurantContainersState createState() => _RestaurantContainersState();
}

class _RestaurantContainersState extends State<RestaurantContainers> {
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

    List<NearBy> nearbyList = widget.nearByData;

    return SizedBox(
      height: 220.0,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: nearbyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: index == nearbyList.length - 1
                ? EdgeInsets.fromLTRB(16.0, 0, 16.0, 0)
                : EdgeInsets.fromLTRB(16.0, 0, 0, 0),
            child: IntrinsicWidth(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.65,
                    height: 120.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        ConstantUrl.URL + nearbyList[index].images[0].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          nearbyList[index].name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: Colors.lightGreen[700]),
                            color: Colors.lightGreen[700],
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  width: 5.0,
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
                  ),
                  Text(
                    nearbyList[index].category.name,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    r'Avg Cost - $' +
                        nearbyList[index].avgCost +
                        'for 2 people',
                    style: TextStyle(color: Colors.black87),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 15.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Flexible(
                          child: Text(
                            nearbyList[index].address,
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
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

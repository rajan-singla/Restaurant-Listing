import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_listings/DeviceType/device_type.dart';
import 'package:restaurant_listings/MediaQueryClasses/different_sizes.dart';
import 'package:restaurant_listings/MediaQueryClasses/size_config.dart';
import 'package:restaurant_listings/Models/home_model.dart';
import 'package:restaurant_listings/app/services/api.dart';
import 'package:restaurant_listings/app/services/api_service.dart';
import 'package:restaurant_listings/constants/constants.dart';
import 'package:restaurant_listings/enums/device_screen_type.dart';
import 'package:restaurant_listings/providers/home_provider.dart';
import 'package:restaurant_listings/ui_screens/restaurant_containers.dart';
import 'package:restaurant_listings/utils/shared_ui.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void func() async {
    final apiService = new APIService(API.sandbox());
    final accessToken = await apiService.getRestaurantData(restaurantId: "5f4d3d2f7933b27106cfbb40");
    print(accessToken);
  }

  @override
  void initState() {
    super.initState();
    final homeMD1 = Provider.of<HomeDataProvider>(context, listen: false);
    homeMD1.getPostData();
    //_updateHomeData();
  }

  // Future<void> _updateHomeData() async {
  //   final homeMD1 = Provider.of<HomeDataProvider>(context, listen: false);
  //   await homeMD1.getPostData();
  //   setState(() => _homeModelData = Provider.of<HomeDataProvider>(context));
  // }

  @override
  Widget build(BuildContext context) {
    final homeMdl = Provider.of<HomeDataProvider>(context);
    Size size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      SizeConfig().init(constraints, MediaQuery.of(context).orientation,
          MediaQuery.of(context));
      final orientationType = getDeviceType(MediaQuery.of(context));
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen[700],
          title: SizedBox(
            height: kToolbarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size2(orientationType),
                ),
                Text(
                  "Hi, Vivianna",
                  style: TextStyle(
                      fontSize: size15(orientationType),
                      letterSpacing: 1.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size2(orientationType),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: size15(orientationType),
                            ),
                            SizedBox(
                              width: size5(orientationType),
                            ),
                            Text(
                              "Disneyland naheim, California",
                              style: TextStyle(
                                  fontSize: size12(orientationType),
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: size4(orientationType),
                            ),
                            GestureDetector(
                              onTap: () {
                                print("tapped");
                                return func();
                              },
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                                size: size15(orientationType),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("tapped");
                        },
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: homeMdl.loading
            ? circularIndicatorWithoutScaffold()
            : HomeListView(
                orientationType: orientationType,
                data: homeMdl.homePostData.data,
              ),
      );
    });
  }
}

class HomeListView extends StatefulWidget {
  HomeListView({Key key, this.orientationType, this.data}) : super(key: key);
  final DeviceScreenType orientationType;
  final Data data;

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    List<HomeBanner> bannersList = widget.data.banners;
    List<NearBy> nearByList = widget.data.nearBy;
    print(bannersList.map((e) => e.image).toList());
    DeviceScreenType orientationType = widget.orientationType;

    return ListView(
      children: [
        SizedBox(
          height: size200(orientationType),
          width: SizeConfig.screenFullWidth,
          child: CarouselSlider(
            items: bannersList
                .map(
                  (imageItem) => Image.network(
                    ConstantUrl.URL + imageItem.image,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
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
        SizedBox(
          height: size10(orientationType),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size16(orientationType),
              vertical: size16(orientationType)),
          child: Text(
            "Trending Restaurants",
            style: TextStyle(
                fontSize: size16(orientationType), fontWeight: FontWeight.bold),
          ),
        ),
        RestaurantContainers(
            orientationType: orientationType, nearByData: nearByList),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size16(orientationType),
              vertical: size8(orientationType)),
          child: Text(
            "Nearby Restaurants",
            style: TextStyle(
                fontSize: size16(orientationType), fontWeight: FontWeight.bold),
          ),
        ),
        RestaurantContainers(
            orientationType: orientationType, nearByData: nearByList),
      ],
    );
  }
}

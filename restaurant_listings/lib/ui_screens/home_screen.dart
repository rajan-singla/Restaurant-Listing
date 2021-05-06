import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_listings/Models/home_model.dart';
import 'package:restaurant_listings/constants/constants.dart';
import 'package:restaurant_listings/providers/home_provider.dart';
import 'package:restaurant_listings/ui_screens/restaurant_containers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // void func() async {
  //   final apiService = new APIService(API.sandbox());
  //   final accessToken = await apiService.getHomeData();
  //   print(accessToken);
  // }

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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 15.0,
                            ),
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
      body: homeMdl.loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : HomeListView(
              size: size,
              data: homeMdl.homePostData.data,
            ),
    );
  }
}

class HomeListView extends StatefulWidget {
  HomeListView({Key key, this.size, this.data}) : super(key: key);
  final Size size;
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

    return ListView(
      children: [
        SizedBox(
          height: 200.0,
          width: widget.size.width,
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
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            "Trending Restaurants",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
        RestaurantContainers(nearByData: nearByList),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Text(
            "Nearby Restaurants",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        ),
        RestaurantContainers(nearByData: nearByList),
      ],
    );
  }
}

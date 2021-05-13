import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_listings/MediaQueryClasses/different_sizes.dart';
import 'package:restaurant_listings/MediaQueryClasses/size_config.dart';
import 'package:restaurant_listings/Models/restaurant_model.dart';
import 'package:restaurant_listings/enums/device_screen_type.dart';
import 'package:restaurant_listings/providers/home_provider.dart';
import 'package:restaurant_listings/ui_screens/restaurant_containers.dart';
import 'package:restaurant_listings/utils/shared_ui.dart';

class AboutRestaurant extends StatefulWidget {
  AboutRestaurant({Key key, this.orientationType, this.restaurantId})
      : super(key: key);
  final DeviceScreenType orientationType;
  final String restaurantId;

  @override
  _AboutRestaurantState createState() => _AboutRestaurantState();
}

class _AboutRestaurantState extends State<AboutRestaurant> {
  @override
  void initState() {
    super.initState();
    final restaurantMD1 = Provider.of<HomeDataProvider>(context, listen: false);
    restaurantMD1.getRestaurantDetails(widget.restaurantId);
  }

  @override
  Widget build(BuildContext context) {
    final restaurantMD1 = Provider.of<HomeDataProvider>(context);

    return restaurantMD1.loading
        ? circularIndicatorWithScaffold()
        : RestaurantDetailsScreen(
            orientationType: widget.orientationType,
            restaurantDetailsData: restaurantMD1.restaurantDetails);
  }
}

//Main UI starts from here
class RestaurantDetailsScreen extends StatefulWidget {
  RestaurantDetailsScreen(
      {Key key, this.orientationType, this.restaurantDetailsData})
      : super(key: key);
  final DeviceScreenType orientationType;
  final RestaurantModel restaurantDetailsData;

  @override
  _RestaurantDetailsScreenState createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  ScrollController _scrollViewController;
  bool isAppBarExpanded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      setState(() {
        isAppBarExpanded = _scrollViewController.position.pixels ==
            _scrollViewController.position.maxScrollExtent;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['Reviews', 'Offers', 'About'];
    final RestaurantModelData data = widget.restaurantDetailsData.data;

    return DefaultTabController(
      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  expandedHeight: SizeConfig.screenFullHeight * 0.45,
                  flexibleSpace: DecoratedBox(
                    decoration: BoxDecoration(
                        color:
                            isAppBarExpanded ? Colors.grey[300] : Colors.white),
                    child: FlexibleSpaceBar(
                      background: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
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
                                  height: size8(widget.orientationType),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            size16(widget.orientationType)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  data.name,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: size16(widget
                                                          .orientationType),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: size2(widget
                                                            .orientationType),
                                                        color: Colors
                                                            .lightGreen[700]),
                                                    color:
                                                        Colors.lightGreen[700],
                                                    borderRadius: BorderRadius
                                                        .circular(size50(widget
                                                            .orientationType)),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: size8(widget
                                                            .orientationType),
                                                        vertical: size2(widget
                                                            .orientationType)),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.star,
                                                          color: Colors.white,
                                                          size: size15(widget
                                                              .orientationType),
                                                        ),
                                                        SizedBox(
                                                          width: size5(widget
                                                              .orientationType),
                                                        ),
                                                        Text(
                                                          data.ratingAvg
                                                                      .toString()
                                                                      .length ==
                                                                  1
                                                              ? '${data.ratingAvg}.0'
                                                              : '${data.ratingAvg}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
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
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            data.name,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: size12(
                                                    widget.orientationType)),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size5(widget.orientationType),
                                        ),
                                        Flexible(
                                          child: Text(
                                            r'Avg Cost - $' +
                                                data.avgCost +
                                                ' for 2 people',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: size12(
                                                    widget.orientationType)),
                                          ),
                                        ),
                                        // Text(
                                        //   r'Avg Cost - $' +
                                        //       nearbyList[index].avgCost +
                                        //       'for 2 people',
                                        //   style: TextStyle(color: Colors.black87),
                                        // ),
                                        SizedBox(
                                          height: size5(widget.orientationType),
                                        ),
                                        Flexible(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.grey,
                                                size: size15(
                                                    widget.orientationType),
                                              ),
                                              SizedBox(
                                                width: size5(
                                                    widget.orientationType),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  data.address,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: size12(widget
                                                          .orientationType),
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
                                        Flexible(
                                          child: RichText(
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                                text: "Open now",
                                                style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: size12(widget
                                                        .orientationType)),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          ' ${data.openTime} - ${data.closeTime} (Today)',
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                ]),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size4(widget.orientationType),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "Call: ${data.phone}",
                                            style: TextStyle(
                                                fontSize: size12(
                                                    widget.orientationType)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                  forceElevated: innerBoxIsScrolled,
                  pinned: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(0),
                    child: Container(
                      color: Colors.grey[300],
                      child: TabBar(
                        labelColor: Colors.black,
                        indicatorColor: Colors.green[900],
                        // These are the widgets to put in each tab in the tab bar.
                        tabs: _tabs
                            .map((String name) => Tab(text: name))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  // This Builder is needed to provide a BuildContext that is
                  // "inside" the NestedScrollView, so that
                  // sliverOverlapAbsorberHandleFor() can find the
                  // NestedScrollView.
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      // The "controller" and "primary" members should be left
                      // unset, so that the NestedScrollView can control this
                      // inner scroll view.
                      // If the "controller" property is set, then this scroll
                      // view will not be associated with the NestedScrollView.
                      // The PageStorageKey should be unique to this ScrollView;
                      // it allows the list to remember its scroll position when
                      // the tab view is not on the screen.
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber
                          // above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(8.0),
                          // In this example, the inner scroll view has
                          // fixed-height list items, hence the use of
                          // SliverFixedExtentList. However, one could use any
                          // sliver widget here, e.g. SliverList or SliverGrid.
                          sliver: SliverFixedExtentList(
                            // The items in this example are fixed to 48 pixels
                            // high. This matches the Material Design spec for
                            // ListTile widgets.
                            itemExtent: 48.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                // This builder is called for each child.
                                // In this example, we just number each list item.
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              // The childCount of the SliverChildBuilderDelegate
                              // specifies how many children this inner list
                              // has. In this example, each tab has a list of
                              // exactly 30 items, but this is arbitrary.
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

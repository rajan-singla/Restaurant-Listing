import 'package:flutter/material.dart';
import 'package:restaurant_listings/ui_screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  TabbedScreens routeList(index) {
    List widgetOptions;
    widgetOptions = [
      TabbedScreens(page: HomeScreen()),
      TabbedScreens(page: Screen2()),
      TabbedScreens(page: HomeScreen()),
      TabbedScreens(page: Screen2()),
      TabbedScreens(page: Screen2()),
    ];

    return widgetOptions[index];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routeList(_selectedIndex).page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          bottomNavigationBarItems(
            icon: Icon(Icons.home),
            name: 'Home',
          ),
          bottomNavigationBarItems(
            icon: Icon(Icons.find_in_page),
            name: 'Explore',
          ),
          bottomNavigationBarItems(
            icon: Icon(Icons.calculate),
            name: 'Favourites',
          ),
          bottomNavigationBarItems(
            icon: Icon(Icons.favorite_outline),
            name: 'Favourites',
          ),
          bottomNavigationBarItems(
            icon: Icon(Icons.person_outline),
            name: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItems(
      {@required icon, @required name}) {
    return BottomNavigationBarItem(icon: icon, label: name);
  }
}

class TabbedScreens {
  final page;

  TabbedScreens({this.page});
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/maintenance.png", fit: BoxFit.cover),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Under Maintenance',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen[700]),
        )
      ],
    );
  }
}

import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/profile_screen.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';

class MyBottomNavbar extends StatefulWidget {
  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    MyProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(10))),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: 'Fav',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                label: 'Msg',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 1,
            enableFeedback: false,
            iconSize: 25,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            unselectedLabelStyle: const TextStyle(fontSize: 18),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: AppColors().backgroundColor1,
            unselectedItemColor: const Color.fromARGB(255, 129, 129, 129),
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}

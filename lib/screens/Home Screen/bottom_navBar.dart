import 'package:e_commerce_app/State%20Managment/toogleFav.dart';
import 'package:e_commerce_app/screens/Cart%20Screen/cart_screen.dart';
import 'package:e_commerce_app/screens/Home%20Screen/home_screen.dart';
import 'package:e_commerce_app/screens/Profile%20Screens/profile_screen.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomNavbar extends StatefulWidget {
  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  toggleFav controller = Get.put(toggleFav());

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    MyCartScreen(),
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
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(10))),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Center(child: Icon(Icons.shopping_cart)),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notify',
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
    );
  }
}
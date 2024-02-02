import 'package:e_commerce_app/State%20Managment/toogleFav.dart';
import 'package:e_commerce_app/screens/Cart%20Screen/cart_screen.dart';
import 'package:e_commerce_app/screens/Home%20Screen/home_screen.dart';
import 'package:e_commerce_app/screens/Profile%20Screens/profile_screen.dart';
import 'package:e_commerce_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MyBottomNavbar extends StatefulWidget {
  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  toggleFav controller = Get.put(toggleFav());

  int selected = 0;
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: PageView(
          controller: _controller,
          children: [
            DashboardScreen(),
            MyCartScreen(),
            Text("Chat"),
            MyProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          height: Get.height * 0.08,
          child: StylishBottomBar(
            option: BubbleBarOptions(
                padding: EdgeInsets.zero,
                iconSize: 25,
                unselectedIconColor: AppColors().addToCart),
            items: [
              BottomBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text(
                  'Home',
                  style: TextStyle(fontFamily: 'Muli6'),
                ),
                selectedColor: Colors.black,
              ),
              BottomBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                title: const Text(
                  'Cart',
                  style: TextStyle(fontFamily: 'Muli6'),
                ),
                selectedColor: Colors.black,
              ),
              BottomBarItem(
                icon: const Icon(Icons.message_outlined),
                title: const Text(
                  'Chat',
                  style: TextStyle(fontFamily: 'Muli6'),
                ),
                selectedColor: Colors.black,
              ),
              BottomBarItem(
                icon: const Icon(Icons.person_outline),
                title: const Text(
                  'Profile',
                  style: TextStyle(fontFamily: 'Muli6'),
                ),
                selectedColor: Colors.black,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            elevation: 0.0,
            currentIndex: selected,
            onTap: (index) {
              setState(() {
                selected = index;
                _controller.jumpToPage(index);
              });
            },
          ),
        ),
      ),
    );
  }
}

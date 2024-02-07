import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screens/Cart%20Screen/cart_screen.dart';
import 'package:e_commerce_app/screens/Profile%20Screens/widgets/my_account.dart';
import 'package:e_commerce_app/resouces/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  // get user data from firestore for drawer
  Future<Map<String, dynamic>> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return userDoc.data() as Map<String, dynamic>;
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors().backgroundColor2,
      width: Get.width * 0.65,
      child: FutureBuilder<Map<String, dynamic>>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
                child: CupertinoActivityIndicator(
              color: Colors.white,
              animating: true,
            ));
          } else {
            final userData = snapshot.data;
            return Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(userData?["image"]),
                  ),
                  accountName: Text(
                    'Welcome ' + userData?['FirstName'],
                    style: const TextStyle(
                        color: Colors.white, fontSize: 20, fontFamily: "Muli6"),
                  ),
                  accountEmail: Text(
                    userData?['email'],
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors().backgroundColor1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => MyAccount(),
                        transition: Transition.topLevel,
                        duration: Duration(seconds: 2));
                  },
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.shop_2,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Order",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    Get.to(() => MyCartScreen(),
                        transition: Transition.topLevel,
                        duration: Duration(seconds: 2));
                  },
                  leading: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    //alertlogoutbox();
                    // auth.signOut().then((value) => Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) => const LoginScreen())));
                  },
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

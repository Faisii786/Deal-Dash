import 'package:e_commerce_app/screens/profileScreens/profile_screen.dart';
import 'package:e_commerce_app/widgets/account_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    bool isDark = true;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.to(() => MyProfileScreen());
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.light_mode),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/dprofile.png"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            account_containers(icon: Icons.person, name: 'First name'),
            SizedBox(
              height: 20,
            ),
            account_containers(icon: Icons.person, name: 'Last name'),
            SizedBox(
              height: 20,
            ),
            account_containers(icon: Icons.person, name: 'Email'),
            SizedBox(
              height: 20,
            ),
            account_containers(icon: Icons.person, name: 'Phone'),
            SizedBox(
              height: 20,
            ),
            account_containers(icon: Icons.person, name: 'Password'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

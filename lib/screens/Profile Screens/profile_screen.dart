import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/screens/auth/login_page.dart';
import 'package:e_commerce_app/screens/Profile%20Screens/widgets/my_account.dart';
import 'package:e_commerce_app/screens/Profile%20Screens/widgets/profile_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var userId = FirebaseAuth.instance.currentUser!.uid.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection("users")
                    .where("uid", isEqualTo: userId)
                    .snapshots(),
                builder: (context, snapshot) {
                  try {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.connectionState ==
                        ConnectionState.active) {
                      if (snapshot.hasData && snapshot.data != null) {
                        var userData = snapshot.data!.docs.first.data()
                            as Map<String, dynamic>;

                        return CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(userData['image']),
                        );
                      } else {
                        return Text('No data to Display');
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  } catch (exc) {
                    print('exception is: $exc');
                    return Text('An error occurred.');
                  }
                },
              ),
              SizedBox(height: 30),
              ProfileContainer(
                icon: Icons.person_outline,
                title: 'My Account',
                ontap: () {
                  Get.to(() => MyAccount());
                },
              ),
              SizedBox(height: 20),
              ProfileContainer(
                icon: Icons.notifications_active_outlined,
                title: 'Notifications',
                ontap: () {},
              ),
              SizedBox(height: 20),
              ProfileContainer(
                icon: Icons.settings_outlined,
                title: 'Settings',
                ontap: () {
                  print(FirebaseAuth.instance.currentUser!.email.toString());
                },
              ),
              SizedBox(height: 20),
              ProfileContainer(
                icon: Icons.help_outline,
                title: 'Help Center',
                ontap: () {},
              ),
              SizedBox(height: 20),
              ProfileContainer(
                icon: Icons.logout_outlined,
                title: 'Log Out',
                ontap: () {
                  Get.defaultDialog(
                    titlePadding: EdgeInsets.only(top: 10),
                    radius: 10,
                    content: Text(
                      "Are you sure you want to log out?",
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    confirm: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Text(
                              "No",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.off(() => LoginPage());
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(color: Colors.red, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

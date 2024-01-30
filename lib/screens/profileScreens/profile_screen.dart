import 'package:e_commerce_app/auth/login_page.dart';
import 'package:e_commerce_app/screens/profileScreens/my_account.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/profile_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: const Color.fromARGB(255, 128, 128, 128),
            )),
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
              color: Color.fromARGB(255, 49, 49, 49), fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/dprofile.png"),
                radius: 80,
                backgroundColor: AppColors().SearchTextFieldbkgrnClr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 30,
                      color: const Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ProfileContainer(
                  icon: Icons.person_2_outlined,
                  title: 'My Account',
                  ontap: () {
                    Get.to(() => MyAccount());
                  }),
              SizedBox(
                height: 20,
              ),
              ProfileContainer(
                  icon: Icons.notifications_active_outlined,
                  title: 'Notifications',
                  ontap: () {}),
              SizedBox(
                height: 20,
              ),
              ProfileContainer(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  ontap: () {
                    print(FirebaseAuth.instance.currentUser!.email.toString());
                  }),
              SizedBox(
                height: 20,
              ),
              ProfileContainer(
                  icon: Icons.help_outline, title: 'Help Center', ontap: () {}),
              SizedBox(
                height: 20,
              ),
              ProfileContainer(
                  icon: Icons.logout_outlined,
                  title: 'Log Out',
                  ontap: () {
                    Get.defaultDialog(
                      titlePadding: EdgeInsets.only(top: 10),
                      titleStyle: TextStyle(fontSize: 20),
                      radius: 10,
                      content: Text(
                        "Are you sure you want to logout ?",
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
                                child:
                                    Text("No", style: TextStyle(fontSize: 17))),
                            GestureDetector(
                                onTap: () {
                                  Get.off(() => LoginPage());
                                },
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 17),
                                )),
                          ],
                        ),
                      ),
                    );
                  }),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

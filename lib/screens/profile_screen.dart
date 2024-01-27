import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/widgets/profile_container.dart';
import 'package:flutter/material.dart';
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
                radius: 60,
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
                  ontap: () {}),
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
                  ontap: () {}),
              SizedBox(
                height: 20,
              ),
              ProfileContainer(
                  icon: Icons.help_outline, title: 'Help Center', ontap: () {}),
              SizedBox(
                height: 20,
              ),
              ProfileContainer(
                  icon: Icons.logout_outlined, title: 'Log Out', ontap: () {}),
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

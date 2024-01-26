import 'package:e_commerce_app/screens/second.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Deal Dash"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              switch (value) {
                case 'Light Mode':
                  Get.changeTheme(ThemeData.light());
                  break;
                case 'Dark Mode':
                  Get.changeTheme(ThemeData.dark());
                  break;
                case 'System':
                  Get.changeTheme(
                    ThemeData(
                      appBarTheme:
                          AppBarTheme(color: AppColors().backgroundColor),
                      scaffoldBackgroundColor: AppColors().backgroundColor1,
                    ),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return {'Light Mode', 'Dark Mode', 'System'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: const Icon(Icons.more_vert), // Icon with three vertical dots
          ),
        ],
      ),
      body: TextButton(
          onPressed: () {
            Get.to(const SecondScreen());
          },
          child: const Text("Next")),
    );
  }
}

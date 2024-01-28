import 'package:e_commerce_app/auth/login_page.dart';
import 'package:e_commerce_app/screens/introScreens/intro_page1.dart';
import 'package:e_commerce_app/screens/introScreens/intro_page2.dart';
import 'package:e_commerce_app/screens/introScreens/intro_page3.dart';
import 'package:e_commerce_app/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  bool _lastPage = false;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              _lastPage = (value == 2);
            });
          },
          children: [
            introPage1(),
            introPage2(),
            introPage3(),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      "skip",
                      style: GoogleFonts.roboto(
                          fontSize: 17, color: AppColors().whiteColor),
                    )),

                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),

                // next or done
                _lastPage
                    ? GestureDetector(
                        onTap: () {
                          Get.to(() => LoginPage());
                        },
                        child: Text(
                          "done",
                          style: GoogleFonts.roboto(
                              fontSize: 17, color: AppColors().whiteColor),
                        ))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          "next",
                          style: GoogleFonts.roboto(
                              fontSize: 17, color: AppColors().whiteColor),
                        ))
              ],
            ))
      ],
    ));
  }
}

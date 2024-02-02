import 'package:e_commerce_app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileContainer extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback ontap;
  const ProfileContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.ontap});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors().SearchTextFieldbkgrnClr,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: ListTile(
          onTap: widget.ontap,
          contentPadding: EdgeInsets.only(left: 10, right: 10),
          leading: Icon(
            widget.icon,
            color: Colors.red,
            size: 30,
          ),
          title: Text(
            widget.title,
            style: GoogleFonts.roboto(fontSize: 18),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: const Color.fromARGB(255, 128, 128, 128),
          ),
        ),
      ),
    );
  }
}

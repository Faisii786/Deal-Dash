import 'package:e_commerce_app/resouces/colors.dart';
import 'package:flutter/material.dart';

class OtpContainers extends StatelessWidget {
  final TextEditingController otpControllers;
  OtpContainers({super.key, required this.otpControllers});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors().SearchTextFieldbkgrnClr,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: otpControllers,
        keyboardType: TextInputType.number,
        //style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        // inputFormatters: [
        //   LengthLimitingTextInputFormatter(1),
        //   FilteringTextInputFormatter.digitsOnly
        // ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: ('0'),
        ),
        onSaved: (value) {},
      ),
    );
  }
}

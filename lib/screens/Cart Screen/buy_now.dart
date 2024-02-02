// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:e_commerce_app/res/colors.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class BuyButton extends StatefulWidget {
  final String text;
  //final VoidCallback onPressed;
  bool loading;

  BuyButton({
    super.key,
    required this.text,
    //required this.onPressed,
    this.loading = false,
  });

  @override
  State<BuyButton> createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton> {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment() async {
    try {
      // payment intenet create for initiate payment
      paymentIntentData = await createPaymentIntent('20', 'USD');

      // Now display sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          googlePay: true,
          applePay: true,
          style: ThemeMode.system,
          merchantDisplayName: 'Faisal',
          currencyCode: "US",
        ),
      );
      displayPaymentSheet();
    } on StripeException catch (ex) {
      Get.snackbar("Error1", ex.toString());
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error2", e.toString(),
          backgroundColor: Colors.grey, duration: Duration(seconds: 50));
    }
  }

  void displayPaymentSheet() async {
    try {
      Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ));
      setState(() {
        paymentIntentData = null;
      });

      //Get.snackbar("Success", "Paid Sucessfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
          Uri.parse("https://api.stripe.com/v1/payment_intents"),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51OesWGKrSc6pdQwiXDr3B7haCDbQBr64smMtHyZOPiGvw4V1HtbCGHjaB93hogZnTpl381AdNAE1TtwqWANvu8uw004oxl6dGh',
            'Content-Type': 'application/x-www-form-urlencoded',
          });

      return jsonDecode(response.body.toString());
    } catch (e) {
      Get.snackbar("Error4", e.toString());
    }
  }

  calculateAmount(String amount) {
    final price = int.parse(amount) * 100;
    return price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.orange,
            const Color.fromARGB(255, 248, 192, 24),
            Colors.orange,
          ]),
          //color: AppColors().backgroundColor2,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 50,
        child: TextButton(
          onPressed: () async {
            try {
              // Navigate to the new page where card details will be added
              //await Get.to(CardDetailsPage()); // Create CardDetailsPage widget
              // Continue with the payment logic if card details are successfully entered
              makePayment();
            } catch (error) {
              // Handle cancellation or any other error
              Get.snackbar("Error", error.toString());
            }
          },
          child: widget.loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  widget.text,
                  style: GoogleFonts.lato(
                    color: AppColors().blackColor,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}

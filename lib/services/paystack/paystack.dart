import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';
import 'package:webview_flutter/webview_flutter.dart';

// void payStackPayment() {

//   final uniqueTransRef = PayWithPayStack().generateUuidV4();
//   print(uniqueTransRef);

//  PayWithPayStack().now(
//     context:context
//     secretKey: "sk_test_5eb6e3c82fad2eb9351cacb7982200b17fe9dd7a",
//     customerEmail: email,
//     reference:uniqueTransRef,
//     callbackUrl: "https://paystack.com/pay/unikonnect",
//     currency: "GHS",
//     paymentChannel:["mobile_money", "card"],
//     amount:amount ,
//     transactionCompleted: () {
//         print("Transaction Successful");
//     },
//     transactionNotCompleted: () {
//         print("Transaction Not Successful!");
//     });

// }

Future<void> payStackPayment(BuildContext context,
    {String? amount, String? eventId}) async {
  try {
    final uniqueTransRef = PayWithPayStack().generateUuidV4();
    final String? email = await FirebaseAuth.instance.currentUser!.email;

    await PayWithPayStack().now(
        context: context,
        secretKey: "sk_test_5eb6e3c82fad2eb9351cacb7982200b17fe9dd7a",
        customerEmail: email!,
        reference: uniqueTransRef,
        callbackUrl: "https://paystack.com/pay/unikonnect",
        currency: "GHS",
        paymentChannel: ["mobile_money", "card"],
        amount: 2000,
      transactionCompleted: () {
          print("Transaction Successful");
        },
        transactionNotCompleted: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Paid Successfully")));

          Timer(const Duration(seconds: 3), () {
            Get.back();
          });
        });
  } catch (e) {}
}

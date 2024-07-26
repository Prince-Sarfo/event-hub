import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';

Future<void> makePayment(
    {String? eventId, double? amount, String? email}) async {
  DocumentSnapshot? eventDoc;
  var context;
  final uniqueTransRef = PayWithPayStack().generateUuidV4();

  await PayWithPayStack().now(
      context: context,
      secretKey: "sk_test_5eb6e3c82fad2eb9351cacb7982200b17fe9dd7a",
      customerEmail: email!,
      reference: uniqueTransRef,
      callbackUrl: "https://paystack.com/pay/unikonnect",
      paymentChannel: ["mobile_money", "card"],
      currency: "GHS",
      amount: amount!,
      transactionCompleted: () {
        FirebaseFirestore.instance.collection('events').doc(eventDoc!.id).set({
          'joined':
              FieldValue.arrayUnion([FirebaseAuth.instance.currentUser!.uid]),
          'max_entries': FieldValue.increment(-1),
        }, SetOptions(merge: true)).then((value) {
          FirebaseFirestore.instance
              .collection('booking')
              .doc(eventDoc!.id)
              .set({
            'booking': FieldValue.arrayUnion([
              {'uid': FirebaseAuth.instance.currentUser!.uid, 'tickets': 1}
            ])
          });
        });
      },
      transactionNotCompleted: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Payment unsuccessfully")));

        Timer(const Duration(seconds: 3), () {
          Get.back();
        });
      });
}

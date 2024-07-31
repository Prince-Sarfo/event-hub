import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay_with_paystack/pay_with_paystack.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({super.key});

  DocumentSnapshot? eventDoc;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String publicKey = 'pk_test_79878c9dc401ab5dc178c9a4dc1c7fca4038ca32';

  @override
  void initState() {
    super.initState();
    // final uniqueTransRef = PayWithPayStack().generateUuidV4();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: amountController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the amount';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  prefix: Text('GHS'),
                  hintText: '1000',
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    focusColor: Colors.blue,
                    hintText: 'example@gmail.com',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // makePayment( amount: double.parse(amountController.text), email: emailController.text);

                    // the payment code
                    // try {
                    final uniqueTransRef = PayWithPayStack().generateUuidV4();

                    PayWithPayStack().now(
                        context: context,
                        secretKey:
                            "sk_test_5eb6e3c82fad2eb9351cacb7982200b17fe9dd7a",
                        customerEmail: emailController.text.toString(),
                        reference: uniqueTransRef,
                        callbackUrl: "https://paystack.com/pay/unikonnect",
                        paymentChannel: ["mobile_money", "card"],
                        currency: "GHS",
                        amount: double.parse(amountController.text),
                        transactionCompleted: () {
                          // FirebaseFirestore.instance
                          //     .collection('events')
                          //     .doc(widget.eventDoc!.id)
                          //     .set({
                          //   'joined': FieldValue.arrayUnion(
                          //       [FirebaseAuth.instance.currentUser!.uid]),
                          //   'max_entries': FieldValue.increment(-1),
                          // }, SetOptions(merge: true)).then((value) {
                          //   FirebaseFirestore.instance
                          //       .collection('booking')
                          //       .doc(widget.eventDoc!.id)
                          //       .set({
                          //     'booking': FieldValue.arrayUnion([
                          //       {
                          //         'uid':
                          //             FirebaseAuth.instance.currentUser!.uid,
                          //         'tickets': 1
                          //       }
                          //     ])
                          //   });
                          // });
                        },
                        transactionNotCompleted: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Payment unsuccessfully")));

                          Timer(const Duration(seconds: 3), () {
                            Get.back();
                          });
                        });
                    // } catch (e) {
                    //   Get.snackbar('Error', '${e.toString()}');
                    // }
                  },
                  child: const Text(
                    'Make Payment',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

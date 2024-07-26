import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../services/paystack/payment_page.dart';
import '../../services/paystack/paystack.dart';

import '../../widgets/my_widgets.dart';

class CheckOutView extends StatefulWidget {
  DocumentSnapshot? eventDoc;

  CheckOutView(this.eventDoc, {super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int selectedRadio = 0;

  void setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2015),
      lastDate: DateTime(2101),
    );
  }

  String eventImage = '';

  @override
  void initState() {
    super.initState();

    try {
      List media = widget.eventDoc!.get('media') as List;
      Map mediaItem =
          media.firstWhere((element) => element['isImage'] == true) as Map;
      eventImage = mediaItem['url'];
    } catch (e) {
      eventImage = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 27,
                          height: 27,
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/circle.png'),
                            ),
                          ),
                          child: Image.asset('assets/bi_x-lg.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Center(
                        child: myText(
                          text: 'CheckOut',
                          style: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(''),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 1,
                        color: const Color(0xff393939).withOpacity(0.15),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(eventImage),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: myText(
                                      text: widget.eventDoc!.get('event_name'),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 11.67,
                                    height: 15,
                                    child: Image.asset(
                                      'assets/location.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  myText(
                                    text: widget.eventDoc!.get('location'),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              myText(
                                text: widget.eventDoc!.get('date'),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                myText(
                  text: 'Payment Method',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 48,
                      height: 34,
                      child: Image.asset(
                        'assets/paypal.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    myText(
                      text: 'PayStack',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Radio(
                      value: 0,
                      groupValue: selectedRadio,
                      onChanged: (int? value) {
                        setState(() {
                          setSelectedRadio(value!);
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 48,
                      height: 34,
                      child: Image.asset(
                        'assets/strip.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    myText(
                      text: 'Stripe',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Radio(
                      value: 1,
                      groupValue: selectedRadio,
                      onChanged: (int? value) {
                        setState(() {
                          setSelectedRadio(value!);
                        });
                      },
                      activeColor: Colors.blue,
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    myText(
                      text: 'Event Fee',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    myText(
                      text: 'GHS ${widget.eventDoc!.get('price')}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    myText(
                      text: 'Total Ticket',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    myText(
                      text:
                          'GHS ${int.parse(widget.eventDoc!.get('price')) + 2}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 50,
                  width: double.infinity,
                  child: elevatedButton(
                    onpress: () async {
                      // stripe gateway
                      // if(selectedRadio == 0){
                      //   makePayment(eventId: widget.eventDoc!.id);
                      // }

// paystak
                      // if (selectedRadio == 0) {
                      //   Get.to(() => PaymentPage(eventId: widget.eventDoc!.id));
                      // }

                      if (selectedRadio == 0) {
                        Get.to(()=>PaymentPage());
                      }

                      // var controller = WebViewController()
                      //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      //   ..setBackgroundColor(const Color(0x00000000))
                      //   ..setNavigationDelegate(
                      //     NavigationDelegate(
                      //       onProgress: (int progress) {
                      //         // Update loading bar.
                      //       },
                      //       onPageStarted: (String url) {},
                      //       onPageFinished: (String url) {},
                      //       onHttpError: (HttpResponseError error) {},
                      //       onWebResourceError: (WebResourceError error) {},
                      //       onNavigationRequest: (NavigationRequest request) {
                      //         if (request.url
                      //             .startsWith('https://www.youtube.com/')) {
                      //           return NavigationDecision.prevent;
                      //         }
                      //         return NavigationDecision.navigate;
                      //       },
                      //     ),
                      //   )
                      //   ..loadRequest(
                      //       Uri.parse('https://paystack.com/pay/unikonnect'));
                      // // payStack gateway
                      // if (selectedRadio == 0) {
                      // FutureBuilder(
                      //     future:  payStackPayment(context,
                      //         amount:
                      //             '${int.parse(widget.eventDoc!.get('price')) + 2}',
                      //         eventId: widget.eventDoc!.id),
                      //     builder: (BuildContext context,
                      //         AsyncSnapshot<void> snapshot) {
                      //       return WebViewWidget(controller: controller);
                      //     },
                      // );
                      // }
                    },
                    text: 'Book Now',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

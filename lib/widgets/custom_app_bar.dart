import 'package:eventhub/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/notificationn_screen/notification_screen.dart';
import 'my_widgets.dart';

Widget CustomAppBar() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 15),
    child: Row(
      children: [
        SizedBox(
          width: 116,
          child: myText(
              text: 'UniKonnect',
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ),
        const Spacer(),
        SizedBox(
          width: 24,
          height: 22,
          child: InkWell(
            onTap: () {
              Get.to(() => UserNotificationScreen());
            },
            child: Image.asset('assets/Frame.png', color: Colors.blue),
          ),
        ),
        SizedBox(
          width: Get.width * 0.04,
        ),
      ],
    ),
  );
}

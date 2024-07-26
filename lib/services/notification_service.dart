// import 'dart:convert';
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:http/http.dart' as http;
// class LocalNotificationService {


//   static String serverKey = 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDKGj3EeL89LGhe\n60G2W7wlF26ISYceHWImYBL2jCSOykrCl+J6i9BxRf7oqWkADGR1C1jWi93vkIcK\n4pbnS3JTRo3NHQD05AV6aXSsx4O4OvXCcGokuEeE2d4Eeoqq6c5CAQ9xyadGRa7E\nT2QPeVOe1IXJWwuZrokMgDYjtbb8NYnzm3Xku8oDFkZnvQKxlOQy6Vf1tJPs7qQg\nwbKDE5T1FXD13Q4km6S7wdqzmX7wIbhBF2j/cvxckqjyun8yRG86jBH7JnxnXm0P\nUiTA10YQPYXtNGps7V9xYqsPyIGCwEGpy2LlBS2pDUw7d/06GD66nkHh9slREvT2\nlZcVAo9VAgMBAAECggEAAiOueTS1A4sDjNOtNaa5cmQR27f5ifBSMGlOchUwMuHB\n0lcEwvrVaUmOJfzbG3DGJHYLCfRflFBhmZQl+EtUabzCtgPjVXRPeYkBvu16v7nC\nDb2eZgacXTPoNYBtlNsWP50ewnvZvTTyIWpcuwwz/ieuReAkmoseMMdvq0eaaQeM\nPZAyQado5zU96gON3xhGhDN6pOIRUtyNmHYJKNTy9nE4dMzeqx8UIUx2XCFFI+2L\nAFJSo+a+TFegoLHH0s/gm3AgTWvYwGlr+9aWC6io5IPrDVvTXLkQ3Kw7yhzfJrEk\nivSUo+osjSKTxoBcROJsBX6t9StGxe7Tds7SMhaHAQKBgQDrDZvPB4+J20v4vw0R\ngeqsfpJxEFnmmAq27aX43geE9xJACiCqfgCYGHKe/8XM1Ym8MLoP/rm28X33zbTo\n79KtCZNPgMQNvAj11+Rsul601EuzHTPZmIgNRFxmQ6jXaUvRhOt25ndFzvyHhHXx\nQcSIkGV7DAiCrgEjs5HqowdNAQKBgQDcHOl8THXBLEHRNWI3Pi/B/82wDoNIteSW\nkc2LA5DMCtw0sgzYQsowkb9aews5XWivc8kFJ7J2jqAYoAcmC/EBFU1byKbR1loG\nS8piDEyi4cqvAjuGkl6lwrbyGpIk9LjlFWxLYogy1MJ6sxVR5izQ20WeBhegUjhT\nGoCski/+VQKBgQCoaxHO3437qwPecZX9i2cIvZBULvEbhql2tQUNMpmUriuHczpA\nrxPh5vKJ9p5VzFNqYkePGmcbLCGkIuKTXPNJROkmOA9CAA8zh8OGHGuricnLxwrV\nyLMDPo4uQCCEaFAJCgJlKXEgtdS/jSus+ADIER6FcfPPHrp2SD4vLy0WAQKBgEC2\nr17ADA7TODaN/2ZGfjwHPS351ldWQvKRw2CPl86lksBbaLNcT52f/CZZ7p7a+6A5\n5mwBk9KPdDpJMlDZSe4LmUbW41TmNGmNdt8ExrNMtw5lFaMm/XS2nprnfPgoiwOv\nHLu9KFXpf5QberUtexecoAcpu2CDS9QDArm58SpRAoGAXxw9hDLlEq8eQf4wZEao\ny1tmNeHL0xYSxu+/G41kfMruUXPSVx/HocHYfbigpDDjYpDhcOfnVLvNIiHKHJwe\nI9ebsMXiYUezesxybp1QOR8AxTpnXZk3VdczfCZZw+5CzUoZQblAG++umJ15svk3\nlT/dVKqaqO6StuNV9QY4QtA=\n-----END PRIVATE KEY-----\n';

//   static final FlutterLocalNotificationsPlugin
//   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   static void initialize() {
//     const InitializationSettings initializationSettings =
//     InitializationSettings(
//         android: AndroidInitializationSettings("@mipmap/ic_launcher"));
//     _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   static void display(RemoteMessage message) async{
//     try {
//       print("In Notification method");
//       Random random = new Random();
//       int id = random.nextInt(1000);
//       const NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails(
//             "mychanel",
//             "my chanel",
//             importance: Importance.max,
//             priority: Priority.high,
//           )

//       );
//       print("my id is ${id.toString()}");
//       await _flutterLocalNotificationsPlugin.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,);
//     } on Exception catch (e) {
//       print('Error>>>$e');
//     }
//   }

//  static Future<void> sendNotification(
//       {String? title, String? message, String? token}) async {
//     print("\n\n\n\n\n\n\n\n\n\n\n\n");
//     print("token is $token");
//     print("\n\n\n\n\n\n\n\n\n\n\n\n");

//     final data = {
//       "click_action": "FLUTTER_NOTIFICATION_CLICK",
//       "id": "1",
//       "status": "done",
//       'message': message
//     };

//     try {
//       http.Response r = await http.post(
//         Uri.parse('https://fcm.googleapis.com/fcm/send'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'Authorization':

//           'key=$serverKey',
//         },
//         body: jsonEncode(
//           <String, dynamic>{
//             'notification': <String, dynamic>{'body': message, 'title': title},
//             'priority': 'high',
//             'data': data,
//             "to": "$token"
//           },
//         ),
//       );

//       print(r.body);
//       if (r.statusCode == 200) {
//         print('DOne');
//       } else {
//         print(r.statusCode);
//       }
//     } catch (e) {
//       print('exception $e');
//     }
//   }


//   static storeToken() async {
//   try{
//     String? token = await FirebaseMessaging.instance.getToken();
//     print(token);
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .set({'fcmToken': token!}, SetOptions(merge: true));

//   }catch(e){
//     print("error is $e");
//   }
//   }

// }
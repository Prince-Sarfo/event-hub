import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventhub/controller/auth_controller.dart';
import 'package:eventhub/view/bottom_nav_bar/student_nav_view.dart';
import 'package:eventhub/view/home/home.dart';
import 'package:eventhub/view/profile/add_profile.dart';

import 'package:eventhub/view/onboarding/onboarding_screen.dart';

import 'package:eventhub/view/utils/colors.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'controller/data_controller.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'services/notification_service.dart';
import 'view/bottom_nav_bar/bottom_nav_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.toString());
}

void main() async {
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put(AuthController());
  Get.put(DataController());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This is the root of the app
  @override
  Widget build(BuildContext context) {
    DocumentSnapshot? eventData;
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          useMaterial3: true,
        ),

        // persist user date
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  String uid = snapshot.data!.uid;

                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .get(),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.connectionState ==
                          ConnectionState.done) {
                        if (userSnapshot.hasData && userSnapshot.data!.exists) {
                          // Get the userType field from the Firestore document
                          String userType = userSnapshot.data!['userType'];

                          if (userType == 'organizer') {
                            return const BottomBarView();
                          } else if (userType == 'student') {
                            return const StudentNavView();
                          } else {
                            return const Center(
                                child: Text('Unknown user type'));
                          }
                        } else {
                          return const Center(
                              child: Text('User document does not exist'));
                        }
                      } else if (userSnapshot.hasError) {
                        return Center(
                            child: Text('Error: ${userSnapshot.error}'));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                  // end
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }
              return const OnboardingPage();
            }));
  }
}

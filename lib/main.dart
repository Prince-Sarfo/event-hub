import 'package:eventhub/controller/auth_controller.dart';
import 'package:eventhub/view/home/home.dart';
import 'package:eventhub/view/profile/add_profile.dart';


import 'package:eventhub/view/onboarding/onboarding_screen.dart';

import 'package:eventhub/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'controller/data_controller.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'view/bottom_nav_bar/bottom_nav_view.dart';

void main() async {
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return GetMaterialApp(
      
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        // persist user date
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const BottomBarView();
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

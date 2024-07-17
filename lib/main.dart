import 'package:eventhub/controller/auth_controller.dart';
import 'package:eventhub/view/home/home.dart';
import 'package:eventhub/view/profile/add_profile.dart';
import 'package:eventhub/view/responsive/mobile_screen_layout.dart';
import 'package:eventhub/view/responsive/responsive_layout.dart';
import 'package:eventhub/view/responsive/web_screen_layout.dart';

import 'package:eventhub/view/onboarding/onboarding_screen.dart';

import 'package:eventhub/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        // ignore: deprecated_member_use
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        // navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const AddPostScreen(),
        // home: const SignUpScreen(),
        // home: const HomeScreen(),

        // persist user date
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const ProfileScreen();
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

              // when the app is complete I will return the onboarding page
              // return const OnboardingPage();
              // home: const OnboardingPage(),
              // home: AddPostScreen(),
            }));
  }
}

import 'package:eventhub/intro_pages/loading_page.dart';
import 'package:eventhub/pages/home_page.dart';
import 'package:eventhub/pages/onboarding_page.dart';

import 'package:eventhub/services/auth/login_or_register.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: deprecated_member_use
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const OnboardingPage(),
      // home: const LoadingPage(),
      // home: const HomePage(),
      home: const LoginOrRegister(),
    );
  }
}

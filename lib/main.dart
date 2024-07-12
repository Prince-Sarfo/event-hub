import 'package:eventhub/providers/user_provider.dart';
import 'package:eventhub/resources/auth_method.dart';
import 'package:eventhub/responsive/mobile_screen_layout.dart';
import 'package:eventhub/responsive/responsive_layout.dart';
import 'package:eventhub/responsive/web_screen_layout.dart';
import 'package:eventhub/screens/add_post_screen.dart';
import 'package:eventhub/screens/login_screen.dart';
import 'package:eventhub/screens/onboarding/onboarding_screen.dart';
import 'package:eventhub/screens/signup_screen.dart';
import 'package:eventhub/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
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
  runApp(ChangeNotifierProvider(
    create: (context) => AuthMethods(),
    child: const MyApp(),
  )
      // const MyApp(),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This is the root of the app
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MaterialApp(
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
                  return const ResponsiveLayout(
                      mobileScreenLayout: MobileScreenLayout(),
                      webScreenLayout: WebScreenLayout());
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
              // return const LoginScreen();
              return const OnboardingPage();
            }),
      ),
    );
  }
}

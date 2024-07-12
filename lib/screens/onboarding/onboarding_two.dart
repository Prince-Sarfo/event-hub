import 'package:flutter/material.dart';
import 'package:eventhub/components/onboarding_component.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: IntroPageComponent(
            title: "All official news and updates at your finger tips",
            image: 'assets/images/onboardthree.png',
            details:
                'get all the official school announcements, colleges, departments and other clubs events here'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:eventhub/components/onboarding_component.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: IntroPageComponent(
            title: "Get all your campus events at one place",
            image: 'assets/images/onboardone.png',
            details:
                'No more the hustle of finding what events are happening on Campus'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../components/intro_pages_component.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: IntroPageComponent(
            title: "Get all your campus events at one place",
            animation:
                'https://lottie.host/547ba4dd-a9ed-4a1d-bbbb-64998575a9b4/8xijRxWvnt.json',
            details:
                'No more the hustle of finding what events are happening on Campus'),
      ),
    );
  }
}

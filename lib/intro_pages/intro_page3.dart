import 'package:flutter/material.dart';

import '../components/intro_pages_component.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[100],
      child: const Center(
        child: IntroPageComponent(
            title: "Get ready to be lost in this exciting new world",
            animation:
                'https://lottie.host/2aa68c61-a535-44d1-8f4e-de5894067703/YfrcMT3V73.json',
            details:
                'Are you ready to learn, be entertained and network? Then you are just a few taps away'),
      ),
    );
  }
}

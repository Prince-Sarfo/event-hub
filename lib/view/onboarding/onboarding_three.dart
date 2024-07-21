import 'package:flutter/material.dart';

import '../../widgets/onboarding_widget.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue[100],
      child: const Center(
        child: IntroPageComponent(
            title: "Get ready to be lost in this exciting new world",
            image: 'assets/onboardtwo.png',
            details:
                'Are you ready to learn, be entertained and network? Then you are just a few taps away'),
      ),
    );
  }
}

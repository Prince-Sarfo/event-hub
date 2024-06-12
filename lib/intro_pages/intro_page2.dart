import 'package:flutter/material.dart';

import '../components/intro_pages_component.dart';


class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: IntroPageComponent(
            title: "All official news and updates at your finger tips",
            animation:
                'https://lottie.host/20af0544-9463-4cca-a2d5-cbabdb660a92/9pCeDpw4Dt.json',
            details: 'get all the official school announcements, colleges, departments and other clubs events here'),
      ),
    );
  }
}

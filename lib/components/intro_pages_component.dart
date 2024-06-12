import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPageComponent extends StatelessWidget {
  const IntroPageComponent(
      {super.key,
      required this.title,
      required this.animation,
      required this.details});

  final title;
  final animation;
  final details;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'UniKonnect',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(1, 80, 144, 171)),
                ),
              ),
              Container(child: Lottie.network(animation)),
              const SizedBox(
                height: 0,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10)
                    .copyWith(top: 15),
                child: Text(
                  details,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// fast delivery
// 'https://lottie.host/b3927272-1838-4d4e-93a8-a2427f220e2b/9ztwkVE7rp.json'
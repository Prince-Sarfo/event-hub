import 'package:flutter/material.dart';


class IntroPageComponent extends StatelessWidget {
  const IntroPageComponent(
      {super.key,
      required this.title,
      required this.image,
      required this.details});

  final title;
  final image;
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
              Container(
                  child: Image.asset(
                image,
                width: 250,
              )),
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



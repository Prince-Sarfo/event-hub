import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: const Image(image: AssetImage('assets/images/unikonnect.png')),
      )),
    );
  }
}
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40))),
          color: Colors.blue),
      child: const Text(
        'log in',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

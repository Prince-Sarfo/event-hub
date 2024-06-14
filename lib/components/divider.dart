import 'package:flutter/material.dart';

class SignInDivider extends StatelessWidget {
  const SignInDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1.5,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text("or sign in with"),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Divider(
            thickness: 1.5,
          ),
        ),
      ],
    );
  }
}

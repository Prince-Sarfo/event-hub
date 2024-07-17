import 'package:eventhub/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("HOME"),
            IconButton(
                onPressed: () => AuthController().logOut(),
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}

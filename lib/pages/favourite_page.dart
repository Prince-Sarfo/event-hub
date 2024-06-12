import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My favourite food'),
      ),
      body: const Center(
        child: Text('Favourite Page'),
      ),
    );
  }
}

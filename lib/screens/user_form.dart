import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  final String userName;
  final String college;
  final String department;
  final int level;
  final String? photo;
  const UserForm(
      {super.key,
      required this.userName,
      required this.college,
      required this.department,
      required this.level,
      required this.photo
      });

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UniKonnect'),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}

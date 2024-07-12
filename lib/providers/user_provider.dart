import 'package:eventhub/resources/auth_method.dart';
import 'package:flutter/material.dart';
import 'package:eventhub/models/user.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User get getUser => _user!;
  final AuthMethods _authMethods = AuthMethods();

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}

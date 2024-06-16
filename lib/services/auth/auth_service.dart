import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      // sign user in
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // show snackbar with user not found
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('User not found')),
        );
      } else if (e.code == 'wrong-password') {
        // show a snackbar with wrong password
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Wrong password')),
        );
      }
      // Throw an exception in case of an error
      throw e;
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailandPassword(
      String email, String password,) async {
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        // show snackbar with email already in use
        ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Email already in use')),
          );
          }
          // Throw an exception in case of an error
          throw e;
        
    }
  }

  // sign user out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

// Make sure you have a global key for the navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

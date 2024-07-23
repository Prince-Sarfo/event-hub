import 'package:eventhub/view/auth/login.dart';
import 'package:eventhub/view/profile/add_profile.dart';

import 'package:flutter/material.dart';

import '../../controller/auth_controller.dart';
import '../profile/profile.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import '../../widgets/text_field_input.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    if (_passwordController.text == _confirmController.text) {
// sign up user using our auth methods
      String res = await AuthController().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // if string returned is success, user has been created
      if (res == "success") {
        setState(() {
          _isLoading = false;
        });
        // navigate to the home screen
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>  const AddProfile(),
            ),
          );
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        // show the error
        if (context.mounted) {
          // ignore: use_build_context_synchronously
          showSnackBar(context, res);
        }
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, 'password do not match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Image.asset(
                  'assets/unikonnect.png',
                  width: 150,
                ),
                const SizedBox(
                  height: 44,
                ),
                TextFieldInput(
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: 'Enter your password',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: 'Confirm your password',
                  textInputType: TextInputType.text,
                  textEditingController: _confirmController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () {
                    // sign up user using firebase auth email and password
                    signUpUser();
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: blueColor,
                    ),
                    child: !_isLoading
                        ? const Text(
                            'Sign up',
                          )
                        : const CircularProgressIndicator(
                            color: primaryColor,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // google sign in button
                InkWell(
                  onTap: () {
                    // user continue with google provider
                    // AuthMethods().signInWithGoogle();
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: !_isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/google.png"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Continue with Google")
                            ],
                          )
                        : const CircularProgressIndicator(
                            color: primaryColor,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Already have an account?',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          ' Login.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

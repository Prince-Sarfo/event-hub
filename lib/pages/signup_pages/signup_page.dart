import 'package:eventhub/pages/signup_pages/login_page.dart';
import 'package:eventhub/services/auth/auth_service.dart';
import 'package:eventhub/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/google_button.dart';
import '../../components/button.dart';
import '../../components/divider.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;
  const SignUpPage({super.key, required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

// sign up method
  void signUp() async {
    //  get auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      if (_passwordController.text != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Passwords do not match!")));
      }
      await authService.signUpWithEmailandPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ).copyWith(top: 20, bottom: 20),
                  child: const Center(
                    // logo
                    child: Image(
                      image: AssetImage('assets/images/unikonnect.png'),
                      width: 100,
                    ),
                  ),
                ),
                // title
                const Text(
                  "Experience a new world",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                // sub title
                const Text(
                    'World were everything is possible and the limit is your imagination'),
                const SizedBox(
                  height: 20,
                ),

                // name
                TextFieldInput(
                  hintText: 'email',
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                // email
                TextFieldInput(
                  hintText: 'password',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),

                // password
                TextFieldInput(
                  hintText: 'confirm password',
                  textInputType: TextInputType.text,
                  textEditingController: _confirmPasswordController,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 20,
                ),

                // sign in button
                ButtonType(
                  buttonType: "Sign In",
                  onTap: () => {
                    signUp(),
                    FocusScope.of(context).unfocus(),
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                // or sign in with divider
                const SignInDivider(),

                const SizedBox(
                  height: 20,
                ),

                // google sign in button
                const GoogleButton(),

                //  Have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text("Have an account? "),
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: const Text(
                          "Log in",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}

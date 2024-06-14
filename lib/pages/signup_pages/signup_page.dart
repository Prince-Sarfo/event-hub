import 'package:eventhub/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import '../../components/google_button.dart';
import '../../components/button.dart';
import '../../components/divider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
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
                hintText: 'name',
                textInputType: TextInputType.name,
                textEditingController: _nameController,
              ),
              const SizedBox(
                height: 20,
              ),
              // email
              TextFieldInput(
                hintText: 'email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),

              // password
              TextFieldInput(
                hintText: 'password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),

              // sign in button
              const ButtonType(buttonType: "Sign In"),
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
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

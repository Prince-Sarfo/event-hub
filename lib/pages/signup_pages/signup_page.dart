import 'package:eventhub/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ).copyWith(top: 50, bottom: 20),
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
              icon: const Icon(Icons.abc_sharp),
              hintText: 'name',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            // email

            // password

            // login button

            // or sign in with

            // google sign in button
          ],
        ),
      ),
    );
  }
}

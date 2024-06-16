import 'package:eventhub/components/google_button.dart';
import 'package:eventhub/services/auth/auth_service.dart';
import 'package:eventhub/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/divider.dart';
import '../../components/button.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signIn() async {
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInWithEmailandPassword(
        _emailController.text,
        _passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.toString(),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    // function for sign in

    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset(
            'assets/images/unikonnect.png',
            width: 200,
          ),
          SizedBox(
            width: 60,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ).copyWith(top: 10, bottom: 20),
                // child: const Center(
                // logo
                // child: Image(
                //   image: AssetImage('assets/images/unikonnect.png'),
                //   width: 100,
                // ),
                // ),
              ),
              // title
              const Text(
                "Welcome",
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
              const Text('Your network is waiting for you'),
              const SizedBox(
                height: 20,
              ),

              // email
              TextFieldInput(
                hintText: 'name',
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
                isPassword: true,
              ),
              const SizedBox(
                height: 30,
              ),
              // or sign in with button
              ButtonType(
                buttonType: "Log In",
                onTap: ()=>{
                  signIn(),
                  FocusScope.of(context).unfocus(),
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // sign in divider
              const SignInDivider(),
              const SizedBox(
                height: 20,
              ),
              // google sign in button
              const GoogleButton(),

              // Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Text("Don't have an account? "),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        "Register",
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
    );
  }
}

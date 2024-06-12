import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final Icon icon;
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  const TextFieldInput(
      {super.key,
      required this.icon,
      required this.textEditingController,
      required this.hintText,
      required this.textInputType,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}

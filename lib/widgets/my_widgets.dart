import 'package:flutter/material.dart';

Widget myTextField(
    {text,
    String? icon,
    bool,
    TextEditingController? controller,
    Function? validator}) {
  return SizedBox(
    height: 45,
    child: TextFormField(
      validator: (input) => validator!(input),
      obscureText: bool,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 5),
          errorStyle: const TextStyle(fontSize: 0),
          hintStyle: const TextStyle(
              // color: AppColors.genderTextColor,
              ),
          hintText: text,
          prefixIcon: Image.asset(
            icon!,
            cacheHeight: 20,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    ),
  );
}

Widget textField(
    {text,
    TextEditingController? controller,
    Function? validator,
    TextInputType inputType = TextInputType.text}) {
  return Container(
    height: 48,
    // margin: EdgeInsets.only(bottom: Get.height * 0.02),
    margin: const EdgeInsets.only(bottom: 20),
    child: TextFormField(
      keyboardType: inputType,
      controller: controller,
      validator: (input) => validator!(input),
      decoration: InputDecoration(
          hintText: text,
          errorStyle: const TextStyle(fontSize: 0),
          contentPadding: const EdgeInsets.only(top: 10, left: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    ),
  );
}

Widget elevatedButton({text, Function? onpress}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
    ),
    onPressed: () {
      onpress!();
    },
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String hint;
  final TextInputType type;
  final String? Function(String?)? validate;
  final bool isPassword;
  final IconData? suffix;
  // ignore: use_key_in_widget_constructors
  const TextFormWidget(
      {required this.hint,
      required this.type,
      this.validate,
      this.isPassword = false,
      this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
          suffixIcon: Icon(suffix),
          hintText: hint,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}

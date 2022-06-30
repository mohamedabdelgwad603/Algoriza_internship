import 'package:flutter/material.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
      {Key? key, required this.text, required this.buttonType})
      : super(key: key);
  final String text;
  final SocialLoginButtonType buttonType;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(10)),
      child: SocialLoginButton(
        buttonType: buttonType,
        text: text,
        textColor: Colors.blue,
        height: 45,
        borderRadius: 10.0,
        width: double.infinity,
        fontSize: 18,
        onPressed: () {},
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../components.dart';

class DefultTextButton extends StatelessWidget {
  const DefultTextButton({Key? key, required this.text, required this.widget})
      : super(key: key);
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          push(context, widget);
        },
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
        ));
  }
}

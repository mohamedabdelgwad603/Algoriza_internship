import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final double radius;
  void Function()? onpressed;
  final bool isBorder;

  DefaultButton(
      {super.key,
      required this.text,
      required this.color,
      this.textColor = Colors.white,
      this.width = double.infinity,
      this.radius = 0.0,
      required this.onpressed,
      this.isBorder = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      width: width,
      //  padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        border: isBorder ? Border.all(color: Colors.blue) : null,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        //  minWidth: double.infinity,
        // height: double.infinity,
        onPressed: onpressed,
        child: Text(text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: textColor)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final double radius;
  void Function()? onpressed;
  final bool isBorder;
  final bool isIcon;
  final IconData? icon;

  DefaultButton({
    super.key,
    required this.text,
    required this.color,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.radius = 0.0,
    required this.onpressed,
    this.isBorder = false,
    this.isIcon = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      //padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        border: isBorder ? Border.all(color: Colors.blue) : null,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIcon) Icon(icon),
            Text(text,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ],
        ),
      ),
    );
  }
}

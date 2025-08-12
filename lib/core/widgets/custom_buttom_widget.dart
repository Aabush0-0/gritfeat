import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonName;
  final Color colorName;
  final Color textColor;
  final Function() onButtonTap;

  const CustomButtonWidget({
    super.key,
    required this.buttonName,
    required this.colorName,
    this.textColor = Colors.black,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colorName,
          border: Border.all(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(buttonName, style: TextStyle(color: textColor)),
      ),
    );
  }
}

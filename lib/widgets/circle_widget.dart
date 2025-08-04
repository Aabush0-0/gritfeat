import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const Circle({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        children: [
          Icon(icon),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

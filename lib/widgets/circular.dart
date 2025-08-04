import 'package:flutter/material.dart';
import 'package:my_app/widgets/circle_widget.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 15,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Circle(name: 'Get', icon: Icons.attach_money, color: Colors.white),
          Circle(name: 'Send', icon: Icons.attach_money, color: Colors.white),
          Circle(name: 'Invoice', icon: Icons.receipt, color: Colors.white),
          Circle(
            name: 'Portfolio',
            icon: Icons.contact_mail_outlined,
            color: Colors.pink.shade200,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
          Container(
            padding: EdgeInsets.all(20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Icon(Icons.attach_money, size: 20),
                Text(
                  'Get',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Icon(Icons.attach_money, size: 20),
                Text(
                  'Send',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Icon(Icons.inbox, size: 20),
                Text(
                  'Invoice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.pink.shade200,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Icon(Icons.contact_mail_outlined, size: 20),
                Text(
                  'Portfolio',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

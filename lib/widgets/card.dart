import 'package:flutter/material.dart';

class MidCard extends StatelessWidget {
  const MidCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 500,
      decoration: BoxDecoration(
        color: Colors.pink.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Superb Bank',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),
            Text(
              '**** **** **** **** 8897',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Victoria Lebid',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '*3322',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

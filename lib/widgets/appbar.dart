import 'package:flutter/material.dart';
import 'package:my_app/views/home.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: CircleAvatar(
            backgroundColor: Colors.pink.shade300,
            child: Icon(Icons.person, size: 25),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.drafts_sharp, size: 30),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(Icons.notification_add),
            ),
          ],
        ),
      ],
    );
  }
}

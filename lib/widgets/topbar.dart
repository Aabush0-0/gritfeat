import 'package:flutter/material.dart';
import 'package:my_app/views/home1.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          height: 50,
          width: 50,
          child: GestureDetector(
            child: Icon(Icons.arrow_back_ios, size: 20),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home1()),
              );
            },
          ),
        ),
        Text(
          'Achievements',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          maxRadius: 30,
          backgroundImage: AssetImage('assets/images/aa.jpg'),
        ),
      ],
    );
  }
}

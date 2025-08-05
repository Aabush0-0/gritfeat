import 'package:flutter/material.dart';
import 'package:my_app/widgets/first_container.dart';
import 'package:my_app/widgets/second.dart';
import 'package:my_app/widgets/third.dart';
import 'package:my_app/widgets/topbar.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 20,
            children: [Topbar(), StatusProgressWidget(), Second(), Third()],
          ),
        ),
      ),
    );
  }
}

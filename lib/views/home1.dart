import 'package:flutter/material.dart';
import 'package:my_app/widgets/appbar.dart';
import 'package:my_app/widgets/card.dart';
import 'package:my_app/widgets/circular.dart';
import 'package:my_app/widgets/portfolio.dart';
import 'package:my_app/widgets/revenue.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              spacing: 10,
              children: [
                TopBarWidget(),
                MidCard(),
                RevenueWidget(),
                CircleWidget(),
                PortfolioWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

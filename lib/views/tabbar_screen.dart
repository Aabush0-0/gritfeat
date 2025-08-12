import 'package:flutter/material.dart';
import 'package:my_app/widgets/mentioned.dart';
import 'package:my_app/widgets/request.dart';
import 'package:my_app/widgets/view_all.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            labelColor: Colors.green,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: Colors.red),
              insets: EdgeInsetsGeometry.symmetric(
                horizontal: MediaQuery.of(context).size.width / 5,
              ),
            ),

            tabs: [
              Tab(text: 'View All'),
              Tab(text: 'Mentioned'),
              Tab(text: 'Requests'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: ViewAll()),
            Center(child: Mentioned()),
            Center(child: Request()),
          ],
        ),
      ),
    );
  }
}

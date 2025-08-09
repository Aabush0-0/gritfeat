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

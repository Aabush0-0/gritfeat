import 'package:flutter/material.dart';

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(color: Colors.yellow[200 * (index % 3)]);
      }, childCount: 20),
    );
  }
}

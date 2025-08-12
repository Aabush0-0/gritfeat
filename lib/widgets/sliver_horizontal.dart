import 'package:flutter/material.dart';

class SliverHorizontalWidget extends StatelessWidget {
  const SliverHorizontalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 100.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 100.0,
              child: Card(color: Colors.red[800 * (index % 2)]),
            );
          },
        ),
      ),
    );
  }
}

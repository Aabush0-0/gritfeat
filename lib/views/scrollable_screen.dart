import 'package:flutter/material.dart';
import 'package:my_app/widgets/sliver_appbar.dart';
import 'package:my_app/widgets/sliver_card.dart';
import 'package:my_app/widgets/sliver_grid.dart';
import 'package:my_app/widgets/sliver_horizontal.dart';
import 'package:my_app/widgets/sliver_list.dart';

class ScrollableScreen extends StatelessWidget {
  const ScrollableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: CustomScrollView(
        slivers: [
          AppbarWidget(),
          CardWidget(),
          CardWidget(),
          CardWidget(),
          CardWidget(),
          SliverHorizontalWidget(),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverGridWidget(),
          SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverListWidget(),
        ],
      ),
    );
  }
}

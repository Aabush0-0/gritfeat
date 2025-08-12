import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Icon(Icons.menu),
      backgroundColor: Colors.red,
      expandedHeight: 300,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          child: Image.asset(
            'assets/images/z.jpg',
            width: 250,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        title: Text('S L I V E R A P P B A R'),
        centerTitle: true,
      ),

      pinned: true,
    );
  }
}

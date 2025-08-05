import 'package:flutter/material.dart';

class StatusLevelItem extends StatelessWidget {
  final String label;
  final Color color;

  const StatusLevelItem({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: const Icon(Icons.emoji_events, color: Colors.white, size: 20),
        ),

        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}

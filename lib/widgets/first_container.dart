import 'package:flutter/material.dart';
import 'package:my_app/widgets/status_level.dart';

class StatusProgressWidget extends StatelessWidget {
  const StatusProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Loyalty Levels',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          // Row of medals with labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatusLevelItem(label: 'Bronze', color: Colors.brown),
              StatusLevelItem(label: 'Silver', color: Colors.grey.shade300),
              StatusLevelItem(label: 'Gold', color: Colors.amber.shade400),
            ],
          ),

          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: LinearProgressIndicator(
              value: 0.6, // your progress value (0.0 - 1.0)
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 6,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          // Progress text
          const Text(
            "You're 2 bookings away from Silver",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

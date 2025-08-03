import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade50,
        title: TextButton(
          child: Text(
            "Where you'll sleep",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      backgroundColor: Colors.amber.shade50,
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildInfoCard(
                      Icons.people,
                      'Maximum occupancy',
                      '2 adults',
                    ),
                    SizedBox(width: 12),
                    _buildInfoCard(
                      Icons.king_bed,
                      "Where you’ll sleep",
                      '1 king bed',
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    'Room features',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.curtains),
                          SizedBox(width: 20),
                          Text('Custom Black Out Curtains'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.desk_outlined),
                          SizedBox(width: 20),
                          Text('Antique Writing Desk and Chair'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.safety_check),
                          SizedBox(width: 20),
                          Text('In-Room Safe'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.tv_sharp),
                          SizedBox(width: 20),
                          Text('Smart TV'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.bathtub_sharp),
                          SizedBox(width: 20),
                          Text('Ensuite Bathroom with Toto Heated Toilet'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.tv),
                          SizedBox(width: 20),
                          Text('Full-length Mirror'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.sensor_window_outlined),
                          SizedBox(width: 20),
                          Text('Window Seat'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.soap_sharp),
                          SizedBox(width: 20),
                          Text('Aesop Bathroom Toiletries'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(width: 20),
                          Text('Matouk Towels and Robes'),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.headphones),
                          SizedBox(width: 20),
                          Text('Dyson Hairdryer'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoCard(IconData icon, String title, String subtitle) {
  return Expanded(
    child: Container(
      height: 180,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon, size: 30, color: Colors.grey),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    ),
  );
}

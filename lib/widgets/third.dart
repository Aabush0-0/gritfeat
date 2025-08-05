import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';
import 'package:my_app/widgets/user_list.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  final List<User> users = [
    User(name: 'Micheal', imagePath: 'assets/images/1.jpg', selected: true),
    User(name: 'James', imagePath: 'assets/images/2.jpg', selected: false),
    User(name: 'Robert', imagePath: 'assets/images/3.jpg', selected: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Referral',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 280,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#5498087AD',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Icon(Icons.file_copy_outlined),
                  ],
                ),
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey.shade300,
                ),
                child: Icon(Icons.share),
              ),
            ],
          ),
          Text(
            'Referred Users',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserList(
                  user: users[index],
                  onChanged: (value) {
                    setState(() {
                      users[index].selected = value!;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

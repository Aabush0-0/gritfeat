import 'package:flutter/material.dart';
import 'package:my_app/models/notification_item.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          NotificationItem(
            imagePath: 'assets/images/1.jpg',
            name: 'John Doe ',
            icon: Icons.person,
            message: 'added a file to',
            subTitle: ' HeathCare Product Dark V1',
            time: '5m ago',
            attachmentTitle: 'T2 Design system.fig',
            attachmentSize: '985.2 mb',
          ),
          NotificationItem(
            imagePath: 'assets/images/2.jpg',
            name: 'Kristin Watson ',
            icon: Icons.star,
            message: 'make you the editor of',
            subTitle: ' Solah',
            time: '12m ago',
          ),
          NotificationItem(
            imagePath: 'assets/images/3.jpg',
            name: 'Alex Adams ',
            icon: Icons.fireplace,
            message: 'request edit access to',
            subTitle: ' Design Audit File',
            time: '7h ago',
            showButtons: true,
          ),
          NotificationItem(
            imagePath: 'assets/images/1.jpg',
            name: 'Jones Smith ',
            icon: Icons.emoji_emotions,
            message: '3 Comments on',
            subTitle: ' HealthCare Product',
            time: 'Aug 30',
          ),
          NotificationItem(
            imagePath: 'assets/images/2.jpg',
            name: 'Ralph Edwards ',
            icon: Icons.emoji_emotions_outlined,
            message: 'invited you to',
            subTitle: ' Mymanu - Omotive',
            time: 'Jul 21',
            showButtons: true,
          ),
        ],
      ),
    );
  }
}

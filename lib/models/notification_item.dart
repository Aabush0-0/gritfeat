import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final IconData icon;
  final String message;
  final String subTitle;
  final String time;
  final String? attachmentTitle;
  final String? attachmentSize;
  final bool showButtons;

  const NotificationItem({
    super.key,
    required this.imagePath,
    required this.name,
    required this.icon,
    required this.message,
    required this.subTitle,
    required this.time,
    this.attachmentTitle,
    this.attachmentSize,
    this.showButtons = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 22,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        children: [
                          TextSpan(
                            text: name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          WidgetSpan(child: Icon(icon, size: 20)),
                          const TextSpan(text: ' '),
                          TextSpan(text: message),
                          TextSpan(
                            text: subTitle,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Text(
                    time,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                  ),
                ],
              ),

              if (attachmentTitle != null && attachmentSize != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 10,
                    children: [
                      const Icon(Icons.insert_drive_file, color: Colors.grey),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              attachmentTitle!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              attachmentSize!,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.download, color: Colors.grey),
                    ],
                  ),
                ),
              ],

              if (showButtons) ...[
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text("Decline"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          minimumSize: const Size(100, 40),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Accept"),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),

        const Divider(height: 1, thickness: 1, color: Colors.grey),
      ],
    );
  }
}

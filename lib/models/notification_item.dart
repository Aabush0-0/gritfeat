import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_app/core/widgets/custom_buttom_widget.dart';

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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: 22,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),

                            children: [
                              TextSpan(
                                text: name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              WidgetSpan(child: Icon(icon, size: 20)),
                              const TextSpan(text: ' '),
                              TextSpan(text: message),
                              TextSpan(
                                text: subTitle,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        if (attachmentTitle != null &&
                            attachmentSize != null) ...[
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
                                const Icon(
                                  Icons.insert_drive_file,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 10,
                            children: [
                              CustomButtonWidget(
                                buttonName: 'Decline',
                                colorName: Colors.white,
                                onButtonTap: () {
                                  log('Declined');
                                },
                              ),
                              CustomButtonWidget(
                                buttonName: 'Accept',
                                colorName: Colors.blue,
                                textColor: Colors.white,
                                onButtonTap: () {
                                  log('Accepted');
                                },
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const Divider(height: 1, thickness: 1, color: Colors.grey),
      ],
    );
  }
}

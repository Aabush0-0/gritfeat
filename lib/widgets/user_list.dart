import 'package:flutter/material.dart';
import 'package:my_app/models/user.dart';

class UserList extends StatelessWidget {
  final User user;
  final ValueChanged<bool?> onChanged;

  const UserList({super.key, required this.user, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 22,
        backgroundImage: AssetImage(user.imagePath),
      ),
      title: Text(user.name),
      trailing: Checkbox(
        value: user.selected,
        onChanged: onChanged,
        activeColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

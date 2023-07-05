import 'package:flutter/material.dart';

enum Priority { urgent, normal, low }

class TodoItem extends StatelessWidget {
  final String text;
  final Priority priority;
  const TodoItem(this.text, this.priority, {super.key});

  @override
  Widget build(BuildContext context) {
    var icon = Icons.list;

    if (priority == Priority.urgent) {
      icon = Icons.notifications_active;
    } else if (priority == Priority.low) {
      icon = Icons.low_priority;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(text)
      ],
    );
  }
}

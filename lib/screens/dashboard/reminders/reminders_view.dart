import 'package:flutter/material.dart';

class ReminderView extends StatelessWidget {
  const ReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
      height: double.infinity,
      color: Colors.green,
      child: Text("reminder"),
    );
  }
}
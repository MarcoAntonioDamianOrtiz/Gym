import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

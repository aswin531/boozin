import 'package:flutter/material.dart';

class ProgressText extends StatelessWidget {
  final String goal;
  final Color textColor;

  const ProgressText({super.key, 
    required this.goal,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "0",
          style: TextStyle(
            color: textColor.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        Text(
          "Goal: $goal",
          style: TextStyle(
            color: textColor.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}


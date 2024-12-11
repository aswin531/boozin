
import 'package:boozinmachinetask/presentation/home/widgets/progress_bar.dart';
import 'package:boozinmachinetask/presentation/home/widgets/progress_text.dart';
import 'package:flutter/material.dart';

class ProgressSection extends StatelessWidget {
  final String title;
  final String value;
  final String goal;
  final double progress;
  final Color textColor;
  final Color progressColor;

  const ProgressSection({super.key, 
    required this.title,
    required this.value,
    required this.goal,
    required this.progress,
    required this.textColor,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    Color progressGrey = Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(200, 200, 200, 1)
        : const Color.fromRGBO(80, 80, 80, 1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '$title : ',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        ProgressBar(progress: progress, progressColor: progressColor, progressGrey: progressGrey),
        const SizedBox(height: 8),
        ProgressText(goal: goal, textColor: textColor),
      ],
    );
  }
}
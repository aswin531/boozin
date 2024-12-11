import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final Color progressColor;
  final Color progressGrey;

  const ProgressBar({super.key, 
    required this.progress,
    required this.progressColor,
    required this.progressGrey,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: progress),
      builder: (context, animatedProgress, child) {
        return Stack(
          children: [
            Container(
              height: 16,
              decoration: BoxDecoration(
                color: progressGrey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: animatedProgress,
              child: Container(
                height: 16,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


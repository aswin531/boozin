import 'dart:ui';
import 'package:boozinmachinetask/presentation/home/widgets/card_container.dart';
import 'package:boozinmachinetask/presentation/home/widgets/icon_section.dart';
import 'package:boozinmachinetask/presentation/home/widgets/progress_section.dart';
import 'package:flutter/material.dart';
import 'package:boozinmachinetask/core/constants/colors.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String value;
  final String goal;
  final String svgPath;
  final Color? progressColor;

  const ProgressCard({
    super.key,
    required this.title,
    required this.value,
    required this.goal,
    required this.svgPath,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = Theme.of(context).textTheme.bodyLarge?.color ?? BoozinColors.iconColor;
    Color defaultProgressColor = progressColor ?? textColor;
    final double progress = double.parse(value.replaceAll(",", "")) / double.parse(goal.replaceAll(",", ""));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: CardContainer(
            progressColor: defaultProgressColor,
            textColor: textColor,
            child: Row(
              children: [
                Expanded(
                  child: ProgressSection(
                    title: title,
                    value: value,
                    goal: goal,
                    progress: progress,
                    textColor: textColor,
                    progressColor: defaultProgressColor,
                  ),
                ),
                const SizedBox(width: 15),
                IconSection(svgPath: svgPath, color: progressColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'dart:ui';

import 'package:boozinmachinetask/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    // Fetch system theme colors
    // Color scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    Color textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? BoozinColors.iconColor;
    // Color progressBackgroundColor = scaffoldBackgroundColor.withOpacity(0.2);

    // Determine progress color if not provided
    Color defaultProgressColor = progressColor ?? textColor;

    // Calculate progress
    final double progress = double.parse(value.replaceAll(",", "")) /
        double.parse(goal.replaceAll(",", ""));

    // Determine outer container color based on the system theme (light or dark)
    Color outerContainerColor = Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(240, 240, 240, 1) // Light theme color
        : const Color.fromRGBO(50, 50, 50, 1); // Dark theme color

    Color progressGrey = Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(200, 200, 200, 1) // Light theme grey
        : const Color.fromRGBO(80, 80, 80, 1); // Dark theme grey

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: outerContainerColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: BoozinColors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Progress Section
                Expanded(
                  child: Column(
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

                      // Progress Bar

                      TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 500),
                        tween: Tween<double>(begin: 0, end: progress),
                        builder: (context, animatedProgress, child) {
                          return Stack(
                            children: [
                              // Non-progress part of the progress bar (background)
                              Container(
                                height: 16, // Increased height
                                decoration: BoxDecoration(
                                  color:
                                      progressGrey, // Color of the non-progress part
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // Progress part of the progress bar
                              FractionallySizedBox(
                                widthFactor: animatedProgress,
                                child: Container(
                                  height:
                                      16, // Increased height to match the non-progress part
                                  decoration: BoxDecoration(
                                    color:
                                        defaultProgressColor, // The progress color
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 8),

                      // Progress Text
                      Row(
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  decoration: BoxDecoration(
                    color:
                        progressColor?.withOpacity(0.2) ?? Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    svgPath,
                    height: 36,
                    width: 36,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

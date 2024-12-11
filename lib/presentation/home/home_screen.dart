import 'package:boozinmachinetask/controllers/boozin_health_controller.dart';
import 'package:boozinmachinetask/presentation/home/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getThemeSpecificIcon(
      BuildContext context, String lightThemeIcon, String darkThemeIcon) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkThemeIcon
        : lightThemeIcon;
  }

  @override
  Widget build(BuildContext context) {
    final BoozinHealthController healthController =
        Get.put(BoozinHealthController());
    Color scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    Color textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
        child: Obx(() {
          if (healthController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (healthController.fitnessDataList.isEmpty) {
            return Center(
              child: Text(
                'No Data Available',
                style: TextStyle(color: textColor),
              ),
            );
          }

          final stepsData = healthController.fitnessDataList[0];
          final caloriesData = healthController.fitnessDataList[0];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 20),

                // Steps Section
                ProgressCard(
                  title: "Steps",
                  value: stepsData.steps.toStringAsFixed(0),
                  goal: "15,000",
                  svgPath: _getThemeSpecificIcon(
                      context,
                      'assets/svgs/ion_footsteps-sharp-light.svg',
                      'assets/svgs/foot_strp_dark.svg'),
                ),
                const SizedBox(height: 10),

                // Calories Section
                ProgressCard(
                  title: "Calories Burned",
                  value: caloriesData.caloriesBurned.toString(),
                  goal: "2000",
                  svgPath: _getThemeSpecificIcon(
                      context,
                      'assets/svgs/kcal-light.svg',
                      'assets/svgs/kcal-dark.svg'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

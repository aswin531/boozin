
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedLogo extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> scaleAnimation;
  final Animation<double> opacityAnimation;
  final Animation<double> fitnessScaleAnimation;
  final Animation<double> fitnessOpacityAnimation;

  const AnimatedLogo({
    required this.controller,
    required this.scaleAnimation,
    required this.opacityAnimation,
    required this.fitnessScaleAnimation,
    required this.fitnessOpacityAnimation,
    super.key,
  });

  String _getThemeSpecificImage(BuildContext context, String lightImage, String darkImage) {
    return Theme.of(context).brightness == Brightness.dark ? darkImage : lightImage;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(
            opacity: opacityAnimation.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset(
                  _getThemeSpecificImage(
                    context,
                    'assets/svgs/Boozin Logo-light.svg',
                    'assets/svgs/Boozin Logo-dark.svg',
                  ),
                  width: 155,
                  height: 90,
                ),
                const SizedBox(height: 10),
                Transform.scale(
                  scale: fitnessScaleAnimation.value,
                  child: Opacity(
                    opacity: fitnessOpacityAnimation.value,
                    child: SvgPicture.asset(
                      _getThemeSpecificImage(
                        context,
                        'assets/svgs/Fitness-light.svg',
                        'assets/svgs/Fitness-dark.svg',
                      ),
                      width: 30,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

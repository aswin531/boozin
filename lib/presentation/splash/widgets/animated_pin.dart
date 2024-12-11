
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedPin extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> positionAnimation;
  final Animation<double> opacityAnimation;

  const AnimatedPin({
    required this.controller,
    required this.positionAnimation,
    required this.opacityAnimation,
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
        return Transform.translate(
          offset: Offset(positionAnimation.value, 0),
          child: Opacity(
            opacity: opacityAnimation.value,
            child: SvgPicture.asset(
              _getThemeSpecificImage(
                context,
                'assets/svgs/pin-light.svg',
                'assets/svgs/pin-dark.svg',
              ),
              width: 80,
              height: 70,
            ),
          ),
        );
      },
    );
  }
}
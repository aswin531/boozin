import 'package:boozinmachinetask/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pinPositionAnimation;
  late Animation<double> _pinOpacityAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoOpacityAnimation;
  late Animation<double> _fitnessLogoScaleAnimation;
  late Animation<double> _fitnessLogoOpacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    // Pin icon animations
    _pinPositionAnimation = Tween<double>(begin: 0.0, end: 50.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
    _pinOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 0.9, curve: Curves.easeInOut),
      ),
    );

    // Logo animations
    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.ease),
      ),
    );
    _logoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      ),
    );

    //Fitness animations
    _fitnessLogoOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
      ),
    );
    _fitnessLogoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
      ),
    );

    // Start the animation
    _controller.forward();

    // Navigate to the home screen after animation
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.to(() => const HomeScreen());
      }
    });
  }

  String _getThemeSpecificImage(String lightImage, String darkImage) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkImage
        : lightImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Pin Animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_pinPositionAnimation.value, 0),
                  child: Opacity(
                    opacity: _pinOpacityAnimation.value,
                    child: SvgPicture.asset(
                      _getThemeSpecificImage(
                        'assets/svgs/pin-light.svg',
                        'assets/svgs/pin-dark.svg',
                      ),
                      width: 80,
                      height: 70,
                    ),
                  ),
                );
              },
            ),
            // Logo Animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _logoScaleAnimation.value,
                  child: Opacity(
                    opacity: _logoOpacityAnimation.value,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SvgPicture.asset(
                          _getThemeSpecificImage(
                            'assets/svgs/Boozin Logo-light.svg',
                            'assets/svgs/Boozin Logo-dark.svg',
                          ),
                          width: 155,
                          height: 90,
                        ),
                        const SizedBox(height: 10),

                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _fitnessLogoScaleAnimation.value,
                              child: Opacity(
                                opacity: _fitnessLogoOpacityAnimation.value,
                                child: SvgPicture.asset(
                                  _getThemeSpecificImage(
                                    'assets/svgs/Fitness-light.svg',
                                    'assets/svgs/Fitness-dark.svg',
                                  ),
                                  width: 30,
                                  height: 20,
                                ),
                              ),
                            );
                          },
                        )
                        //
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

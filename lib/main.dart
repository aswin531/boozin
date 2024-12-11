import 'package:boozinmachinetask/controllers/theme_controller.dart';
import 'package:boozinmachinetask/core/utils/boozin_theme.dart';
import 'package:boozinmachinetask/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController _themeController = Get.put(ThemeController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'boozin',

      //System theme Default
      themeMode: _themeController.themeMode,
      
      //Light theme
      theme: BoozinTheme.lightTheme,

      //Dark theme
      darkTheme: BoozinTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}

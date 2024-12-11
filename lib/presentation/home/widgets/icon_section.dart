import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSection extends StatelessWidget {
  final String svgPath;
  final Color? color;

  const IconSection({super.key, 
    required this.svgPath,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color?.withOpacity(0.2) ?? Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        svgPath,
        height: 36,
        width: 36,
      ),
    );
  }
}

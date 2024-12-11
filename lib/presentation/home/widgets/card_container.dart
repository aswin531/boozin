
import 'package:boozinmachinetask/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final Color progressColor;
  final Color textColor;

  const CardContainer({super.key, 
    required this.child,
    required this.progressColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Color outerContainerColor = Theme.of(context).brightness == Brightness.light
        ? const Color.fromRGBO(240, 240, 240, 1)
        : const Color.fromRGBO(50, 50, 50, 1);

    return Container(
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
      child: child,
    );
  }
}



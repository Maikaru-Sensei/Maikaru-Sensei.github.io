import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  final bool isActive;

  const OnboardingIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 12 : 6,
      width: 4,
      decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}

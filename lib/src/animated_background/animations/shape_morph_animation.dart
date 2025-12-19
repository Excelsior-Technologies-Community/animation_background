import 'dart:math';
import 'package:flutter/material.dart';

class ShapeMorphBackground extends StatefulWidget {
  const ShapeMorphBackground({super.key});

  @override
  State<ShapeMorphBackground> createState() => _ShapeMorphBackgroundState();
}

class _ShapeMorphBackgroundState extends State<ShapeMorphBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final random = Random();

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Stack(
          children: List.generate(4, (index) {
            return Positioned(
              left: random.nextDouble() * 200,
              top: random.nextDouble() * 400,
              child: Container(
                width: 180 + controller.value * 40,
                height: 180 + controller.value * 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.purple.withOpacity(0.3),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

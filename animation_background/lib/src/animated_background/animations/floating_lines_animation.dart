import 'dart:math';
import 'package:flutter/material.dart';

class FloatingLinesBackground extends StatefulWidget {
  const FloatingLinesBackground({super.key});

  @override
  State<FloatingLinesBackground> createState() =>
      _FloatingLinesBackgroundState();
}

class _FloatingLinesBackgroundState extends State<FloatingLinesBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 4))
      ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return CustomPaint(
          painter: FloatingLinesPainter(controller.value), // ✅
          size: Size.infinite,
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

class FloatingLinesPainter extends CustomPainter {
  final double progress;
  FloatingLinesPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.4)
      ..strokeWidth = 2;

    for (int i = 0; i < 8; i++) {
      final y = size.height * (i / 8) + sin(progress * 2 * pi) * 20;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

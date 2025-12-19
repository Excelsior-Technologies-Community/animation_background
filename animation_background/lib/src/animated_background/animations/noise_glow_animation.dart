import 'dart:math';
import 'package:flutter/material.dart';

class NoiseGlowBackground extends StatefulWidget {
  const NoiseGlowBackground({super.key});

  @override
  State<NoiseGlowBackground> createState() => _NoiseGlowBackgroundState();
}

class _NoiseGlowBackgroundState extends State<NoiseGlowBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          painter: _NoisePainter(_random),
          size: MediaQuery.of(context).size,
        );
      },
    );
  }
}

class _NoisePainter extends CustomPainter {
  final Random random;
  _NoisePainter(this.random);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey;
    for (int i = 0; i < 800; i++) {
      canvas.drawCircle(
        Offset(
          random.nextDouble() * size.width,
          random.nextDouble() * size.height,
        ),
        1,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _NoisePainter oldDelegate) => true;
}

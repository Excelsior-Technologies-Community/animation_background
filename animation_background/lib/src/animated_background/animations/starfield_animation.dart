import 'dart:math';
import 'package:flutter/material.dart';

class StarfieldBackground extends StatefulWidget {
  const StarfieldBackground({super.key});

  @override
  State<StarfieldBackground> createState() => _StarfieldBackgroundState();
}

class _StarfieldBackgroundState extends State<StarfieldBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final random = Random();
  late List<Offset> stars;

  @override
  void initState() {
    super.initState();
    stars = List.generate(
      120,
          (_) => Offset(random.nextDouble(), random.nextDouble()),
    );

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return CustomPaint(
          painter: StarPainter(stars, controller.value),
          size: Size.infinite,
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose(); // ✅ MOST IMPORTANT
    super.dispose();
  }
}

class StarPainter extends CustomPainter {
  final List<Offset> stars;
  final double progress;

  StarPainter(this.stars, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;

    for (var s in stars) {
      final y = (s.dy + progress * 0.2) % 1.0;
      canvas.drawCircle(
        Offset(s.dx * size.width, y * size.height),
        1.5,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

import 'package:flutter/material.dart';

class GridBackground extends StatefulWidget {
  const GridBackground({super.key});

  @override
  State<GridBackground> createState() => _GridBackgroundState();
}

class _GridBackgroundState extends State<GridBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return CustomPaint(
          painter: GridPainter(controller.value), // ✅ NOW OK
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

class GridPainter extends CustomPainter {
  final double progress;
  GridPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1;

    const step = 30.0;

    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(
        Offset(x + progress * step, 0),
        Offset(x + progress * step, size.height),
        paint,
      );
    }

    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(
        Offset(0, y + progress * step),
        Offset(size.width, y + progress * step),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

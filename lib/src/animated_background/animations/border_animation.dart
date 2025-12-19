import 'package:flutter/material.dart';

class AnimatedBorder extends StatefulWidget {
  const AnimatedBorder({super.key});

  @override
  State<AnimatedBorder> createState() => _AnimatedBorderState();
}

class _AnimatedBorderState extends State<AnimatedBorder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

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
      builder: (context, child) {
        return CustomPaint(
          painter: DashedBorderPainter(_controller.value),
          child: Container(
            width: 320,
            height: 160,
            alignment: Alignment.center,
            child: const Text(
              '',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double progress;
  DashedBorderPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 10.0;
    const dashSpace = 5.0;

    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    for (final metric in path.computeMetrics()) {
      double distance = -progress * (dashWidth + dashSpace);
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(
            distance.clamp(0, metric.length),
            next.clamp(0, metric.length),
          ),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

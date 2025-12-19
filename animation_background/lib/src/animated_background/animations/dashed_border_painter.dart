import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedDashedBorder extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;

  const AnimatedDashedBorder({
    super.key,
    required this.child,
    this.height = 120,
    this.width = double.infinity,
  });

  @override
  State<AnimatedDashedBorder> createState() => _AnimatedDashedBorderState();
}

class _AnimatedDashedBorderState extends State<AnimatedDashedBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
    _controller.dispose(); // ✅ VERY IMPORTANT
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          painter: DashedBorderPainter(_controller.value),
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: Center(child: widget.child),
          ),
        );
      },
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final double animationValue;

  DashedBorderPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 5.0;
    const dashSpace = 5.0;

    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    final dashPath = Path();

    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final len = dashWidth;
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + len),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
      distance = 0.0;
    }

    // Optional: animate the dash offset
    final dashOffset = animationValue * (dashWidth + dashSpace);
    canvas.drawPath(dashPath.shift(Offset(dashOffset, 0)), paint);
  }

  @override
  bool shouldRepaint(covariant DashedBorderPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}


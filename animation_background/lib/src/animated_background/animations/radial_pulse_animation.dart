import 'package:flutter/material.dart';

class RadialPulseBackground extends StatefulWidget {
  const RadialPulseBackground({super.key});

  @override
  State<RadialPulseBackground> createState() => _RadialPulseBackgroundState();
}

class _RadialPulseBackgroundState extends State<RadialPulseBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
          painter: RadialPulsePainter(_controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class RadialPulsePainter extends CustomPainter {
  final double progress;
  RadialPulsePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final maxRadius = size.shortestSide * 0.5;

    for (int i = 0; i < 3; i++) {
      final t = (progress + i / 3) % 1.0;
      final radius = t * maxRadius;

      final paint = Paint()
        ..color = Colors.purpleAccent.withOpacity(1 - t)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3;

      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

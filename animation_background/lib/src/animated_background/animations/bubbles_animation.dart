import 'dart:math';
import 'package:flutter/material.dart';

class BubbleBackground extends StatefulWidget {
  const BubbleBackground({super.key});

  @override
  State<BubbleBackground> createState() => _BubbleBackgroundState();
}

class _BubbleBackgroundState extends State<BubbleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final Random random = Random();

  static const int bubbleCount = 40;
  static const Duration animationSpeed =
  Duration(seconds: 10);

  late List<Bubble> bubbles;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: animationSpeed,
    )..repeat();

    bubbles = List.generate(bubbleCount, (_) => _createBubble());
  }

  Bubble _createBubble() {
    return Bubble(
      x: random.nextDouble(),
      size: random.nextDouble() * 20 + 10,
      speed: random.nextDouble() * 0.4 + 0.2,
      offset: random.nextDouble(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return CustomPaint(
          size: Size.infinite,
          painter: _BubblePainter(
            progress: controller.value,
            bubbles: bubbles,
          ),
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

class _BubblePainter extends CustomPainter {
  final double progress;
  final List<Bubble> bubbles;

  _BubblePainter({
    required this.progress,
    required this.bubbles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.25)
      ..style = PaintingStyle.fill;

    for (final bubble in bubbles) {
      final double y =
          size.height -
              ((progress + bubble.offset) % 1.0) *
                  size.height *
                  bubble.speed;

      final double x = bubble.x * size.width;

      canvas.drawCircle(
        Offset(x, y),
        bubble.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => true;
}

class Bubble {
  final double x;
  final double size;
  final double speed;
  final double offset;

  Bubble({
    required this.x,
    required this.size,
    required this.speed,
    required this.offset,
  });
}

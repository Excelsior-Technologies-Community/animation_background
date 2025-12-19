import 'package:animation_background/src/animated_background/animated_background.dart';
import 'package:animation_background/src/animated_background/background_type.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AnimatedBackground(type: BackgroundType.particles),
        ],
      ),
    );
  }
}

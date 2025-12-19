import 'package:animation_background/src/animated_background/animations/border_animation.dart';
import 'package:animation_background/src/animated_background/animations/bubbles_animation.dart';
import 'package:animation_background/src/animated_background/animations/floating_lines_animation.dart';
import 'package:animation_background/src/animated_background/animations/gradient_animation.dart';
import 'package:animation_background/src/animated_background/animations/grid_animation.dart';
import 'package:animation_background/src/animated_background/animations/noise_glow_animation.dart';
import 'package:animation_background/src/animated_background/animations/particles_animation.dart';
import 'package:animation_background/src/animated_background/animations/radial_pulse_animation.dart';
import 'package:animation_background/src/animated_background/animations/shape_morph_animation.dart';
import 'package:animation_background/src/animated_background/animations/starfield_animation.dart';
import 'package:animation_background/src/animated_background/animations/wave_animation.dart';
import 'package:animation_background/src/animated_background/widgets/animation_preview_card.dart';
import 'package:flutter/material.dart';

class AllAnimationsScreen extends StatelessWidget {
  const AllAnimationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Text('Animation Background'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // ===== EXISTING =====
          AnimationPreviewCard(
            title: 'Bubble Animation',
            subtitle: 'Perfect for login & splash screens',
            child: BubbleBackground(),
          ),
          const SizedBox(height: 20),
          const AnimationPreviewCard(
            title: 'Gradient Animation',
            subtitle: 'Perfect for login & splash screens',
            child: GradientBackground(),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Particle Animation',
            subtitle: 'Music apps, gaming dashboards',
            child: ParticleBackground(),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Wave Animation',
            subtitle: 'Meditation, fitness, weather UI',
            child: WaveBackground(),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Shape Morph Animation',
            subtitle: 'Modern UI, creative apps',
            child: ShapeMorphBackground(),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Animated Border',
            subtitle: 'Call-to-Action buttons',
            child: Center(child: AnimatedBorder()),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Noise Glow',
            subtitle: 'Premium modern UI background',
            child: NoiseGlowBackground(),
          ),
          const SizedBox(height: 30),

          // ===== NEW ADDED =====
          const AnimationPreviewCard(
            title: 'Floating Lines',
            subtitle: 'AI, music & data visual UI',
            child: FloatingLinesBackground(),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Moving Grid',
            subtitle: 'Tech & dashboard background',
            child: GridBackground(),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Radial Pulse',
            subtitle: 'Focus & loading screens',
            child: RadialPulseBackground(),
          ),
          const SizedBox(height: 20),

          const AnimationPreviewCard(
            title: 'Starfield',
            subtitle: 'Gaming & space UI',
            child: StarfieldBackground(),
          ),
        ],
      ),
    );
  }
}

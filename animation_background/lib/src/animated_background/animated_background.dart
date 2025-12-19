import 'package:animation_background/src/animated_background/animations/border_animation.dart';
import 'package:animation_background/src/animated_background/animations/dashed_border_painter.dart';
import 'package:animation_background/src/animated_background/animations/floating_lines_animation.dart';
import 'package:animation_background/src/animated_background/animations/grid_animation.dart';
import 'package:animation_background/src/animated_background/animations/noise_glow_animation.dart';
import 'package:animation_background/src/animated_background/animations/radial_pulse_animation.dart';
import 'package:animation_background/src/animated_background/animations/shape_morph_animation.dart';
import 'package:animation_background/src/animated_background/animations/starfield_animation.dart';
import 'package:animation_background/src/animated_background/animations/wave_animation.dart';
import 'package:animation_background/src/animated_background/animations/wave_painter.dart';
import 'package:animation_background/src/animated_background/background_type.dart';
import 'package:flutter/material.dart';
import 'animations/gradient_animation.dart';
import 'animations/bubbles_animation.dart';
import 'animations/particles_animation.dart';

class AnimatedBackground extends StatelessWidget {
  final BackgroundType type;

  const AnimatedBackground({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case BackgroundType.gradient:
        return const GradientBackground();
      case BackgroundType.bubbles:
        return const BubbleBackground();
      case BackgroundType.particles:
        return const ParticleBackground();
      case BackgroundType.wave:
        return const WaveBackground();
      case BackgroundType.shapeMorph:
        return const ShapeMorphBackground();
      case BackgroundType.border:
        return const AnimatedBorder();
      case BackgroundType.dashed_border:
        return const AnimatedDashedBorder(child: Text('hello'),);
      case BackgroundType.star:
        return const StarfieldBackground();
      case BackgroundType.grid:
        return const GridBackground();
      case BackgroundType.line:
        return const FloatingLinesBackground();
      case BackgroundType.noise:
        return const NoiseGlowBackground();
      case BackgroundType.painter_wave:
        return const AnimatedWaveBackground();
      case BackgroundType.radial:
        return const RadialPulseBackground();

    }

    return const SizedBox.shrink();

  }
}

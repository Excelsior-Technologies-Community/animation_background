# AnimationBackground

A lightweight Flutter package that provides beautiful animated backgrounds such as bubbles, gradients, waves, particles, borders, starfields, and more — without any third‑party animation packages.

Perfect for splash screens, onboarding, dashboards, and modern UI backgrounds.

---
## ✨ Features
* 🫧 Bubble animation
* 🌈 Gradient animation
* 🌊 Wave animation
* ✨ Particles animation
* ⭐ Starfield animation
* 🟦 Grid animation
* 🔲 Animated border
* 🔆 Noise glow effect
* 🔵 Radial pulse
* 🔺 Shape morphing
* ➰ Floating lines
---
## ✨ Preview
![screen-20251219-1605362](https://github.com/user-attachments/assets/eec5819c-b355-4c51-93aa-621e6b48730e)

---
### All animations are:
* Smooth & performant
* CustomPaint based
* Easy to use
* Library‑ready

## 📦 Installation
Add this to your package's pubspec.yaml file:
```
dependencies:
  animation_background:
    path: ../animation_background  # For local development
```
from git:
```
dependencies:
  animation_background:
    git:
      url: https://github.com/yourusername/animation_background.git  # Your github path
```
Then run:
```
flutter pub get
```
---
## 🎛 Available Background Types
```
BackgroundType.bubbles
BackgroundType.gradient
BackgroundType.waves
BackgroundType.particles
BackgroundType.starfield
BackgroundType.grid
BackgroundType.border
BackgroundType.noiseGlow
BackgroundType.radialPulse
BackgroundType.shapeMorph
BackgroundType.floatingLines
```
---
## 🎛 BackgroundType Enum
```
enum BackgroundType {
  bubbles,
  gradient,
  waves,
  particles,
  starfield,
  grid,
  border,
  noiseGlow,
  radialPulse,
  shapeMorph,
  floatingLines,
}
```
---
## 🧩 AnimatedBackground Widget
```
AnimatedBackground(
  backgroundType: BackgroundType.waves,
)
```
---
## 🗂 Project Structure
```
lib/
├─ animation_background.dart
└─ src/
   └─ animated_background/
   ├─ animations/
   ├─ models/
   ├─ screens/
   ├─ animated_background.dart
   └─ background_type.dart
```
   ---
## 🚀 Usage
Basic Example:
```
import 'package:flutter/material.dart';
import 'package:animation_background/animation_background.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          AnimatedBackground(
            backgroundType: BackgroundType.bubbles,
          ),
          Center(
            child: Text(
              'Hello Animation!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
         ),
      ],
     ),
   );
 }
}
```
---
## 📜 License
MIT License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
---

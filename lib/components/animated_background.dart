import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

ParticleOptions particles = const ParticleOptions(
  baseColor: Colors.cyan,
  spawnOpacity: 0.0,
  opacityChangeRate: 0.3,
  minOpacity: 0.01,
  maxOpacity: 0.15,
  particleCount: 50,
  spawnMaxRadius: 10.0,
  spawnMaxSpeed: 25.0,
  spawnMinSpeed: 15.0,
  spawnMinRadius: 3.0,
);

var customBehavior = RandomParticleBehaviour(options: particles);

class CustomAnimatedBackground extends AnimatedBackground {
  CustomAnimatedBackground(
      {super.key,
      required super.child,
      required super.vsync,
      required super.behaviour});

  Widget build(BuildContext context) {
    return AnimatedBackground(
      behaviour: behaviour,
      vsync: vsync,
      child: child,
    );
  }
}

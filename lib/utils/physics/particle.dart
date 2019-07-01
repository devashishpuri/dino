import 'dart:math';

import 'package:dino/utils/physics/vector.dart';

class Particle {
  Vector particlePosition;
  Vector velocity;
  Vector gravity;
  double mass;
  double friction;

  // ########## | Setters and Getters | ########## //

  double get x {
    return particlePosition.x;
  }

  double get y {
    return particlePosition.y;
  }

  set x(double xVal) {
    particlePosition.x = xVal;
  }

  set y(double yVal) {
    particlePosition.y = yVal;
  }

  // ########## | Methods | ########## //

  init(double x, double y,
      {double speed,
      double speedAngle,
      double downGravity,
      double friction = 1}) {
    particlePosition = Vector(x: x, y: y);
    velocity = Vector(x: 0, y: 0);
    velocity.length = speed;
    velocity.angle = speedAngle;
    gravity = Vector(x: 0, y: (downGravity != null ? downGravity : 0));
    friction = friction;
  }

  accelerate(Vector acceleration) {
    velocity.add(acceleration);
  }

  // update() {
  calculate() {
    velocity.multiply(friction);
    velocity.addVector(gravity);
    particlePosition.add(velocity);
  }

  angleTo(Particle particle2) {
    return atan2(
        particle2.particlePosition.y - particlePosition.y, particle2.particlePosition.x - particlePosition.x);
  }

  distanceTo(Particle partile2) {
    double dx = partile2.particlePosition.x - particlePosition.x;
    double dy = partile2.particlePosition.y - particlePosition.y;
    return sqrt(dx * dx + dy * dy);
  }

  gravitateTo(Particle particle2) {
    Vector gravity = Vector(x: 0, y: 0);
    double distance = distanceTo(particle2);
    gravity.length = particle2.mass / (distance * distance);
    gravity.angle = angleTo(particle2);

    velocity.addVector(gravity);
  }
}

// abstract class ParticleComponent extends Particle {
//   double get x {
//     return particlePosition.x;
//   }

//   double get y {
//     return particlePosition.y;
//   }

//   set x(double xVal) {
//     particlePosition.x = xVal;
//   }

//   set y(double yVal) {
//     particlePosition.y = yVal;
//   }
// }

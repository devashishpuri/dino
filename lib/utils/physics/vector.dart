import 'dart:math';

class Vector {
    double x = 0;
    double y = 0;

    Vector({this.x, this.y});

    get length {
      return sqrt(x * x + y * y);
    }

    set angle(double angle) {
      x = cos(angle) * length;
      y = sin(angle) * length;
    }

    get angle {
      return atan2(y, x);
    }

    set length(double length) {
      x = cos(angle) * length;
      y = sin(angle) * length;
    }

    add(Vector v2) {
      return Vector(x: x + v2.x, y: y + v2.y);
    }

    subtract(Vector v2) {
      return Vector(x: x - v2.x, y: y - v2.y);
    }

    multiply(double val) {
      return Vector(x: x * val, y: y * val);
    }

    divide(double val) {
      return Vector(x: x / val, y: y / val);
    }

    addVector(Vector v2) {
      x += v2.x;
      y += v2.y;
    }

    subtractVector(Vector v2) {
      x -= v2.x;
      y -= v2.y;
    }

    multiplyVector(Vector v2) {
      x *= v2.x;
      y *= v2.y;
    }

}
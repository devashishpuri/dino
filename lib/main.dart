import 'dart:ui' as DartUi;
import 'package:dino/dino/dino.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

void main() async {
  DartUi.Image spriteSheet = (await Flame.images.loadAll(["dino-sprite.png"]))[0];

  runApp(DinoGame(sprite: spriteSheet).widget);
}

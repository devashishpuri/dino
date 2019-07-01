import 'dart:ui';

import 'package:dino/dino/player/player.config.dart';

import 'package:flame/sprite.dart';
import 'package:flame/components/animation_component.dart';

import 'package:flame/animation.dart';

class RunningState extends AnimationComponent {
  RunningState(Image spriteImage)
      : super(
            PlayerConfig.width,
            PlayerConfig.height,
            Animation.spriteList([
              Sprite.fromImage(
                spriteImage,
                width: PlayerConfig.width,
                height: PlayerConfig.height,
                y: 8.0,
                x: 272.0,
              ),
              Sprite.fromImage(
                spriteImage,
                width: PlayerConfig.width,
                height: PlayerConfig.height,
                y: 8.0,
                x: 360.0,
              ),
            ], stepTime: 0.2, loop: true));
}

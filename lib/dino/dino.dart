import 'dart:async';
import 'dart:ui';

import 'package:dino/dino/player/player.config.dart';
import 'package:dino/dino/player/player.dart';
import 'package:dino/utils/colors_pallete.util.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';

class DinoGame extends BaseGame {
  Size screenSize;
  Player player;

  bool gameOver;

  double currentSpeed = PlayerConfig.speed;

  DinoGame({Image sprite}) {
    player = Player(sprite: sprite);
    _addGestureRecognizers();
    // add(player);
  }

  _addGestureRecognizers() async {
    await Future.delayed(Duration(milliseconds: 0));
    Flame.util.addGestureRecognizer(createTapRecognizer());
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, screenSize.width, screenSize.height),
        GamePalette.gameBackground.paint);
    canvas.drawRect(
        Rect.fromLTWH(0, screenSize.height * 0.67, screenSize.width,
            screenSize.height * 0.33),
        GamePalette.gameGround.paint);
    player.render(canvas);
  }

  @override
  void update(double t) {
    player.update(t);
  }

  TapGestureRecognizer createTapRecognizer() {
    return new TapGestureRecognizer()
      ..onTapUp = (TapUpDetails details) {
        // print(details.globalPosition.dx);
        if (gameOver) {
          // restart();
          return;
        }
        // player.startJumping(this.currentSpeed);
      };
  }

  void resize(Size size) {
    super.resize(size);
    screenSize = size;
    // Send to Descendants
    player.resize(size);
  }
}

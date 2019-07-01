import 'dart:ui';

import 'package:dino/dino/player/states/running.state.dart';
import 'package:dino/utils/custom_composed_component.util.dart';
import 'package:dino/utils/physics/particle.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/resizable.dart';

enum PlayerStatus { crashed, jumping, ducking, running, waiting, intro }

class Player extends PositionComponent
    with ComposedComponent, Resizable, Particle {
  Size screenSize;
  RunningState runningState;
  PlayerStatus status = PlayerStatus.running;

  Player({Image sprite}) {
    runningState = RunningState(sprite);
    // y = yPosition;
    // x = size.width * 0.20;
  }

  _init() {
    init(screenSize.width * 0.20, y, speed: 0, speedAngle: 0, downGravity: 9.8);
  }

  RunningState get playerState {
    switch (status) {
      case PlayerStatus.waiting:
        return runningState;
      case PlayerStatus.jumping:
        return runningState;
      case PlayerStatus.ducking:
        return runningState;
      case PlayerStatus.crashed:
        return runningState;
      case PlayerStatus.intro:
      case PlayerStatus.running:
      default:
        return runningState;
    }
  }

  get isJumping => status == PlayerStatus.jumping;
  get isDucking => status == PlayerStatus.ducking;

  jump() {
    if (!isJumping) {
      _initJump();
    }
  }

  _initJump() {}

  duck() {
    if (!isDucking) {
      _initDuck();
    }
  }

  _initDuck() {}

  @override
  void render(Canvas c) {
    playerState.render(c);
  }

  @override
  void update(double t) {
    // playerState.calculate();
    // playerState.y = yPosition;
    width = playerState.width;
    height = playerState.height;
    playerState.x = x;
    playerState.y = y;
    playerState.update(t);
  }

  void resize(Size size) {
    super.resize(size);
    screenSize = size;
    y = size.height * 0.67 - 86 + 8;
    _init();
  }
}

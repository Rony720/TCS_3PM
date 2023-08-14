import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import '../../main.dart';
import '../game/flappy_bird.dart';
import 'toptube_component.dart';
import 'bottomtube_component.dart';

enum BirdWingsState { up, down }

// We use this global variable

class BirdComponent extends SpriteGroupComponent<BirdWingsState>
    with HasGameRef<FlappyBird>, CollisionCallbacks {
  bool wingsDown = true;
  late double birdHeight;
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    // Screen
    double screenHeight = gameRef.size[1];
    birdHeight = screenHeight * 0.05;

    Sprite birdWingUp = await gameRef.loadSprite('bird.png');
    Sprite birdWingDown = await gameRef.loadSprite('bird2.png');

    sprites = {
      BirdWingsState.down: birdWingDown,
      BirdWingsState.up: birdWingUp
    };

    current = BirdWingsState.down;

    position = gameRef.size / 2;
    height = width = birdHeight;
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Game Paused
    if (changer.isGamePaused) return;

    // Changing wings to make it look fly
    if (wingsDown) {
      wingsDown = false;
      current = BirdWingsState.up;
    } else {
      wingsDown = true;
      current = BirdWingsState.down;
    }

    if (changer.sensitivity == 0) {
      gameRef.children.forEach((child) {
        if (child is BottomtubeComponent) {
          if (position.y < (child.y * 0.99) &&
              child.isPassed == false) // .99 makes hit
          {
            position.y += 1.5;
          } else if (position.y > (child.y * 1.3) && child.isPassed == false) {
            position.y -= 1.5;
          }

          if (child.x < position.x * 1.3 && child.isPassed == false) {
            changer.isGamePaused = true;
            changer.notify();
            child.isPassed = true;
          }
        }
      });
    }

    if (changer.sensitivity != 0) {
      position.y += 0.75;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if ((other is ToptubeComponent || other is BottomtubeComponent) &&
        changer.isGamePaused == false) {
      FlameAudio.play('flappySound.mp3');
      changer.isGamePaused = true;
      changer.notify();

      // GameOverMenu overlay
      gameRef.overlays.add('GameOverMenu');
    }
  }
}

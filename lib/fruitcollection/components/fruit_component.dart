import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

import '../../main.dart';
import '../game/fruitcollection.dart';

// Defining FruitComponent class, extending SpriteComponent and implementing HasGameRef<FruitCollection>
class FruitComponent extends SpriteComponent with HasGameRef<FruitCollection> {
  late int positionIndex;
  late double speed;
  FruitComponent(this.positionIndex);
  // Overriding onLoad method
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    // Different x position
    var positions = [
      gameRef.size[0] * 0.1,
      gameRef.size[0] * 0.4,
      gameRef.size[0] * 0.7
    ];

    sprite = await gameRef.loadSprite('orange.png');
    size = gameRef.size * 0.06;
    position = Vector2(positions[positionIndex], gameRef.size[1] * 0.3);

    add(CircleHitbox());

    if (changer.sensitivity == 0) speed = 0.6;
    if (changer.sensitivity == 1) speed = 1.7;
  }

  // Overriding update method
  @override
  void update(double dt) {
    super.update(dt);

    // Game Paused
    if (changer.isGamePaused) return;

    if (position.y > gameRef.size[1] - (gameRef.size[1] * .1)) {
      removeFromParent();
      gameRef.fruitMissed += 1;
      FlameAudio.play('fruitMissed.mpeg');

      if (gameRef.fruitMissed >= 5) {
        changer.isGamePaused = true;
        changer.notify();
        gameRef.overlays.add("GameOverMenu");
      }
    } else {
      position.y += speed;
    }
  }
}

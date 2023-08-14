import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

import '../game/fruitcollection.dart';
import 'fruit_component.dart';

class BoyComponent extends SpriteComponent
    with HasGameRef<FruitCollection>, CollisionCallbacks {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('boy.png');
    size = Vector2(gameRef.size[1] / 5, gameRef.size[1] / 5);
    x = gameRef.size[0] * 0.4;
    y = gameRef.size[1] / 1.3;

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is FruitComponent) {
      print("HIT");
      FlameAudio.play('fruitCollected.mpeg');
      gameRef.fruitCollected += 1;
      gameRef.remove(other);
    }
  }
}

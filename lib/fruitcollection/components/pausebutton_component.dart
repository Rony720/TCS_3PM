import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_auth_page/main.dart';

import '../game/fruitcollection.dart';

class PauseButton extends SpriteComponent
    with HasGameRef<FruitCollection>, Tappable {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('pause.png');
    size = gameRef.size * 0.09;
    position = Vector2(gameRef.size[0] * 0.8, gameRef.size[1] * 0.1);
  }

  @override
  bool onTapDown(TapDownInfo info) {
    try {
      if (!changer.isGamePaused) {
        changer.isGamePaused = true;
        changer.notify();
        gameRef.overlays.add('PauseMenu');
      }
      return super.onTapDown(info);
    } catch (e) {
      print(e);
      return false;
    }
  }
}

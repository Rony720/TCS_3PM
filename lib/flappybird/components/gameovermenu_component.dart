import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_page/main.dart';

import '../game/flappy_bird.dart';

// Widget for the game over menu
class GameOverMenu extends StatelessWidget {
  final FlappyBird gameRef;
  const GameOverMenu({super.key, required this.gameRef});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.white.withOpacity(0.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                children: [
                  const Text(
                    'GAME OVER',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'SCORE: ${gameRef.score}',
                    style: const TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 77, 255),
                        padding: EdgeInsets.all(12)),
                    onPressed: () {
                      gameRef.overlays.remove('GameOverMenu');
                      changer.isGamePaused = false;
                      changer.notify();
                      gameRef.reset(true);
                    },
                    child: const Text(
                      'Restart',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.all(12)),
                    onPressed: () {
                      changer.isGamePaused = false;
                      changer.notify();
                      gameRef.removeAllExit();
                      gameRef.reset(true);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

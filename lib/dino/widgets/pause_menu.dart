import 'dart:ui';

import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../widgets/hud.dart';
import '../game/dino_run.dart';
import '../widgets/main_menu.dart';
import '../game/audio_manager.dart';
import '../models/player_data.dart';

// This represents the pause menu overlay.
class PauseMenu extends StatelessWidget {
  // An unique identified for this overlay.
  static const id = 'PauseMenu';

  // Reference to parent game.
  final DinoRun gameRef;

  const PauseMenu(this.gameRef, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: gameRef.playerData,
      child: Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.black.withAlpha(100),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Selector<PlayerData, int>(
                        selector: (_, playerData) => playerData.currentScore,
                        builder: (_, score, __) {
                          return Text(
                            'Score: $score',
                            style: const TextStyle(
                                fontSize: 40, color: Colors.white),
                          );
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        gameRef.overlays.remove(PauseMenu.id);
                        gameRef.overlays.add(Hud.id);
                        // gameRef.resumeEngine();
                        changer.isGamePaused = false;
                        changer.isPauseMenu = false;
                        changer.notify();
                        AudioManager.instance.resumeBgm();
                      },
                      child: const Text(
                        'Resume',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        gameRef.overlays.remove(PauseMenu.id);
                        gameRef.overlays.add(Hud.id);
                        // gameRef.resumeEngine();
                        changer.isGamePaused = false;
                        changer.isPauseMenu = false;
                        changer.notify();
                        gameRef.reset(false);
                        gameRef.startGamePlay();
                        AudioManager.instance.resumeBgm();
                      },
                      child: const Text(
                        'Restart',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        gameRef.reset(false);
                        Navigator.pop(
                          context,
                        );
                        gameRef.overlays.remove(PauseMenu.id);
                        gameRef.overlays.add(MainMenu.id);
                        // gameRef.resumeEngine();
                        changer.isGamePaused = false;
                        changer.notify();
                        gameRef.reset(false);
                        FlameAudio.bgm.dispose();
                      },
                      child: const Text(
                        'Exit',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

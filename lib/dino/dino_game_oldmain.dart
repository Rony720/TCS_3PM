import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/dino/widgets/instructiondino_head.dart';
import 'package:flutter_auth_page/dino/widgets/instructiondino_lower.dart';

import '../main.dart';
import 'widgets/hud.dart';
import 'game/dino_run.dart';
import 'widgets/main_menu.dart';
import 'widgets/pause_menu.dart';
import 'widgets/settings_menu.dart';
import 'widgets/game_over_menu.dart';

late DinoRun _dinoRun;

// The main widget for this game.
class DinoRunApp extends StatelessWidget {
  DinoRunApp({
    Key? key,
  }) : super(key: key) {
    _dinoRun = DinoRun();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        // This will dislpay a loading bar until [DinoRun] completes
        // its onLoad method.
        loadingBuilder: (conetxt) => const Center(
          child: SizedBox(
            width: 200,
            child: LinearProgressIndicator(),
          ),
        ),
        // Register all the overlays that will be used by this game.
        overlayBuilderMap: {
          MainMenu.id: (_, DinoRun gameRef) => MainMenu(gameRef),
          PauseMenu.id: (_, DinoRun gameRef) => PauseMenu(gameRef),
          Hud.id: (_, DinoRun gameRef) => Hud(gameRef),
          GameOverMenu.id: (_, DinoRun gameRef) => GameOverMenu(
                gameRef,
              ),
          SettingsMenu.id: (_, DinoRun gameRef) => SettingsMenu(gameRef),
          'InstructionDino': (_, DinoRun gameRef) {
            return changer.currentSelectedBodyPart == "HEAD" ?InstructionDinoHead(gameRef) : InstructionDinoLeg(gameRef);
          },
        },
        // By default MainMenu overlay will be active.
        initialActiveOverlays: const [MainMenu.id],
        game: _dinoRun,
      ),
    );
  }
}

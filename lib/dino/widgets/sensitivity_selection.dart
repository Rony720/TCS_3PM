import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_auth_page/dino/game/dino_run.dart';

import '../../main.dart';
import 'hud.dart';

class SensitivityDino extends StatelessWidget {
  final DinoRun gameRef;
  const SensitivityDino({super.key, required this.gameRef});

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
                    'Choose Sensitivity',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.all(12)),
                    onPressed: () {
                      changer.isGamePaused = false;
                      changer.sensitivity = 0;
                      changer.notify();
                      gameRef.overlays.remove('Sensitivity');
                      gameRef.overlays.add(Hud.id);

                      gameRef.startGamePlay();
                    },
                    child: const Text(
                      'Practice',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.all(12)),
                    onPressed: () {
                      changer.isGamePaused = false;
                      changer.sensitivity = 1;
                      changer.notify();
                      gameRef.overlays.remove('Sensitivity');
                      gameRef.overlays.add(Hud.id);

                      gameRef.startGamePlay();
                    },
                    child: const Text(
                      'Normal',
                      style: TextStyle(
                        fontSize: 30,
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

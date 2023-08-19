import 'dart:ui';

import 'package:flutter/material.dart';

import '../../main.dart';
import '../game/fruitcollection.dart';

class SensitivityFruit extends StatelessWidget {
  final FruitCollection gameRef;
  const SensitivityFruit({super.key, required this.gameRef});

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

import 'dart:ui';

import 'package:flutter/material.dart';

import '../game/flappy_bird.dart';

// Widget for displaying instructions in Flappy Bird game
class InstructionFlappyHead extends StatelessWidget {
  final FlappyBird gameRef;
  const InstructionFlappyHead({super.key, required this.gameRef});

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
                    'Instructions',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'To make your bird jump in the game,\nsimply turn your face upwards,\nand your bird will flap its wings\nand soar through the obstacles!',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.all(12)),
                    onPressed: () {
                      // gameRef.isGamePaused = false;

                      gameRef.overlays.remove('InstructionFlappy');

                      gameRef.overlays.add('Sensitivity');
                    },
                    child: const Text(
                      'Continue',
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

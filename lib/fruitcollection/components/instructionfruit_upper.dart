import 'dart:ui';

import 'package:flutter/material.dart';

import '../game/fruitcollection.dart';

class InstructionFruitArm extends StatelessWidget {
  final FruitCollection gameRef;
  const InstructionFruitArm({super.key, required this.gameRef});

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
                    "To control the boy\'s movement,move your\nleft or right arm.Collect as many falling\nfruits as you can to score points, but be careful\nnot to miss any,or you'll lose a life!",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.all(12)),
                    onPressed: () {
                      gameRef.isGamePaused = false;
                      gameRef.overlays.remove('InstructionFruit');
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

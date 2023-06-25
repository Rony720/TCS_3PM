
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/flappy_lower/flappyface/components/gameovermenu_component.dart';
import 'package:flutter_auth_page/flappy_lower/flappyface/components/instruction_page.dart';
import 'package:flutter_auth_page/flappy_lower/flappyface/components/startmenu_component.dart';
import 'package:flutter_auth_page/flappy_lower/flappyface/game/flappy_bird.dart';
import 'package:flutter_auth_page/flappy_lower/vision_detector_views/detector_views.dart';

class FlappyPoseDetection extends StatelessWidget {
  const FlappyPoseDetection({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home:
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.65,
          child: GameWidget(
            game: FlappyBird(),
            overlayBuilderMap: {
              'StartMenu': (BuildContext context, FlappyBird flappyBird) {
                return StartMenu(
                  gameRef: flappyBird,
                );
              },
              'GameOverMenu': (BuildContext context, FlappyBird flappyBird) {
                return GameOverMenu(
                  gameRef: flappyBird,
                );
              },
              'InstructionPage': (_, FlappyBird gameRef) =>
                  InstructionPage(gameRef),
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          child: PoseDetectorViewFlappy(),
        ),
      ],
    ));
  }
}
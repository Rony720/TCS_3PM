import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import '../../MLKIT/facedetection/vision_detector_views/face_detector_view.dart';
import '../../MLKIT/lowerposedetection/vision_detector_views/pose_detector_view.dart';
import '../../main.dart';
import '../components/gameovermenu_component.dart';
import '../components/instruction_page_head.dart';
import '../components/instruction_page_lower.dart';
import '../components/startmenu_component.dart';
import 'flappy_bird.dart';

class FlappyFaceDetect extends StatelessWidget {
  const FlappyFaceDetect({super.key});

  @override
  Widget build(BuildContext context) {
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
              'InstructionFlappy':
                  (BuildContext context, FlappyBird flappyBird) {
                return changer.currentSelectedBodyPart == "HEAD"
                    ? InstructionFlappyHead(
                        gameRef: flappyBird,
                      )
                    : InstructionFlappyLeg(
                        gameRef: flappyBird,
                      );
              },
            },
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.35,
          child: changer.currentSelectedBodyPart == "HEAD"
              ? FaceDetectorView()
              : const PoseDetectorView(),
        ),
      ],
    ));
  }
}

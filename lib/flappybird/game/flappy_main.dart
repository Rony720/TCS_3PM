import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/flappybird/components/sensitivity_selection.dart';
import '../components/instruction_page_upper.dart';

import '../../MLKIT/facedetection/vision_detector_views/face_detector_view.dart';
import '../../MLKIT/lowerposedetection/vision_detector_views/pose_detector_view.dart';
import '../../MLKIT/upperposedetection/vision_detector_views/pose_detector_view_upper.dart';
import '../../main.dart';
import '../components/gameovermenu_component.dart';
import '../components/instruction_page_head.dart';
import '../components/instruction_page_lower.dart';
import '../components/pauseMenu.dart';
import '../components/startmenu_component.dart';
import 'flappy_bird.dart';

// The FlappyFaceDetect widget is defined as a stateless widget.
class FlappyFaceDetect extends StatelessWidget {
  const FlappyFaceDetect({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Stop or pause audio when back button is pressed
        FlameAudio.bgm
            .stop(); // or use pause() method if you want to resume later

        // Return true to allow back navigation
        return true;
      },
      child: Scaffold(
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
                'Sensitivity': (BuildContext context, FlappyBird flappyBird) {
                  return SensitivityFlappy(
                    gameRef: flappyBird,
                  );
                },
                'PauseMenu': (BuildContext context, FlappyBird flappyBird) {
                  return PauseMenuFlappy(
                    gameRef: flappyBird,
                  );
                },
                'InstructionFlappy':
                    (BuildContext context, FlappyBird flappyBird) {
                  return changer.currentSelectedBodyPart == "HEAD"
                      ? InstructionFlappyHead(
                          gameRef: flappyBird,
                        )
                      : changer.currentSelectedBodyPart == "HAND"
                          ? InstructionFlappyShoulder(
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
                : changer.currentSelectedBodyPart == "HAND"
                    ? const PoseDetectorViewHand()
                    : const PoseDetectorView(),
          ),
        ],
      )),
    );
  }
}

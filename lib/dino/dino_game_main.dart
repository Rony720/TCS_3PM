import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../MLKIT/facedetection/vision_detector_views/face_detector_view.dart';
import '../MLKIT/lowerposedetection/vision_detector_views/pose_detector_view.dart';
import '../main.dart';
import 'dino_game_oldmain.dart';
import 'models/settings.dart';
import 'models/player_data.dart';


class DinoRunFace extends StatelessWidget {
  // BuildContext rootContext;
  const DinoRunFace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.60,
          child: DinoRunApp(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.40,
          child: changer.currentSelectedBodyPart == "HEAD"
              ? FaceDetectorView()
              : const PoseDetectorView(),
        ),
      ],
    ));
  }
}

// This function will initilize hive with apps documents directory.
// Additionally it will also register all the hive adapters.
Future<void> initHive() async {
  // For web hive does not need to be initialized.
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
  Hive.registerAdapter<Settings>(SettingsAdapter());
}

// The main widget for this game.


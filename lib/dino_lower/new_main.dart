import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auth_page/dino_lower/old_main.dart';
import 'package:flutter_auth_page/dino_lower/vision_detector_views/pose_detector_view_dino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/player_data.dart';
import 'models/settings.dart';

final Changer changer = Changer();

class DinoLower extends StatelessWidget {
  const DinoLower({super.key});

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
          height: MediaQuery.of(context).size.height*0.60,
          child: DinoRunApp(),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height*0.40,
          child: PoseDetectorViewDino(),
        ),
      ],
    ));
  }
}

class Changer extends ChangeNotifier {
// Dino
  int selectedOpt_dinoLower = 0;
  bool positionCaptureDinoLower = true;
  double poseStandingDinoLower = 0;
  void notify() {
    notifyListeners();
  }
}


Future<void> initHive() async {
  // For web hive does not need to be initialized.
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  Hive.registerAdapter<PlayerData>(PlayerDataAdapter());
  Hive.registerAdapter<Settings>(SettingsAdapter());
}
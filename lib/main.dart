import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auth_page/pages/login.dart';
import 'package:flutter_auth_page/pages/signup.dart';
import 'package:flutter_auth_page/pages/welcome.dart';
import 'package:get/get.dart';

import 'dino/dino_game_main.dart' as dinoHead;
import 'dino_lower/new_main.dart' as dinoLower;
import 'firebase_options.dart';
import 'quizPose/models/Questions.dart';

List<CameraDescription> cameras = [];
final Changer changer = Changer();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dinoHead.initHive();
  await dinoHead.initHive();
  await dinoLower.initHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/drawer': (context) => const
        '/': (context) => const Welcome(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
      },
    );
  }
}

class Changer extends ChangeNotifier {
  int currentBar = 0; // for choosing gap
  late int flappyNosePoint;
  bool firstFrame = true;

  bool isFlappyHeadUp = false; // used in flappy

  // FLAPPY ENDS

  // Quiz

  double poseStanding = 0;
  int selectedOpt_quiz = -1;
  bool positionCapture = true;

  late Question myQuestion;

  void notify() {
    notifyListeners();
  }
}

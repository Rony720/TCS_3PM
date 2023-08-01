import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'package:flutter_auth_page/pages/login.dart';
import 'package:flutter_auth_page/pages/signup.dart';
import 'package:flutter_auth_page/pages/welcome.dart';
import 'package:get/get.dart';

import 'dino/dino_game_main.dart' as dinoHead;
import 'firebase_options.dart';
import 'main_page.dart';
import 'quizPose/models/Questions.dart';

List<CameraDescription> cameras = [];
final Changer changer = Changer();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dinoHead.initHive();
  await dinoHead.initHive();
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
        '/': (context) => const MainPage(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
      },
    );
  }
}

class Changer extends ChangeNotifier {
  // SELECTED GAMES WILL BE "FLAPPY","DINO","FRUT","QUIZ"
  String currentSelectedGame = "";

  // SELECTED BODY PART WILL BE "HEAD","HAND","LEG"
  String currentSelectedBodyPart = "";

  // FLAPPY

  int currentBar = 0; // for choosing gap
  late int flappyNosePoint;
  bool firstFrame = true;
  bool isFlappyUp = false; // used in flappy

  bool changeframe = false;
  late double flappyright, flappyleft;

  // FLAPPY ENDS

  // DINO

  bool firstFrameDino = true;
  late int DinoNosePoint;
  bool isDinoJump = false;

  bool positionCaptureDinoLower = true;
  double poseStandingDinoLower = 0;

  // Hive BoxNames
  Map<String, String> hiveBoxName = {
    'LEG': "DinoRunLeg",
    'HEAD': "DinoRunFace",
    'HAND':"DinoRunHand"
  };

  bool isDinoUp = false;
  late double dinoWrist;
  bool position = false;
  // DINO ENDS

  //FRUIT
  bool frame = true;
  late double fruitleft, fruitright;
  //FRUIT ENDS

  // QUIZ

  double poseStanding = 0;
  int selectedOpt_quiz = -1;
  bool positionCapture = true;
  late Question myQuestion;

  // QUIZ END

  void notify() {
    notifyListeners();
  }
}

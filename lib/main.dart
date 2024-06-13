import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/pages/privacy_policy.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_auth_page/pages/login.dart';
import 'package:flutter_auth_page/pages/signup.dart';

import 'package:get/get.dart';
import 'package:flutter_auth_page/pages/headprogress.dart';
import 'package:flutter_auth_page/pages/lowerprogress.dart';
import 'package:flutter_auth_page/pages/upperprogress.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dino/dino_game_main.dart' as dinoHead;
import 'firebase_options.dart';
import 'main_page.dart';
import 'screen_quiz/models/Questions.dart';

import 'pages/termsandconditions.dart';

//global variables
List<CameraDescription> cameras = [];
final Changer changer = Changer();

// Main function
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
  runApp(MyApp());
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/privacy': (context) => PrivacyPolicyPage(),
        '/main': (context) => const MainPage(),
        '/terms': (context) => TermsAndConditionsPage(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/headchart': (context) => const HeadProgress(isShowingMainData: true),
        '/lowerchart': (context) =>
            const LowerProgress(isShowingMainData: true),
        '/upperchart': (context) =>
            const UpperProgress(isShowingMainData: true),
      },
    );
  }
}

// Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacementNamed('/');
    // });
  }

  Future<void> _navigateToNext() async {
    final prefs = await SharedPreferences.getInstance();
    final hasAcceptedTerms = prefs.getBool('hasAcceptedTerms') ?? false;

    await Future.delayed(const Duration(seconds: 3));
    if (hasAcceptedTerms) {
      Navigator.of(context).pushReplacementNamed('/main');
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1334));
    final double logoSize = ScreenUtil().screenWidth / 1.5;
    final double fontSize = ScreenUtil().screenWidth * 0.04;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/neuro_logo.png', // Path to your main logo image
              width: logoSize,
              height: logoSize,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: logoSize * 0.9,
                    maxHeight: logoSize * 0.2,
                  ),
                  child: Image.asset(
                    'assets/images/punarjeeva_logo.webp',
                    width: logoSize * 0.9,
                    height: logoSize * 0.9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Powered by Punarjeeva Technology Solutions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: fontSize,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Splash Screen End

// Change notifier class for managing game state
class Changer extends ChangeNotifier {
  // SELECTED GAMES WILL BE "FLAPPY","DINO","FRUT","QUIZ"
  String currentSelectedGame = "";

  // SELECTED BODY PART WILL BE "HEAD","HAND","LEG"
  String currentSelectedBodyPart = "";

  // For All Games

  bool isGamePaused = true;
  int sensitivity = -1; // 0 - Practice  1 - Normal
  bool isPauseMenu = false;

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
    'HAND': "DinoRunHand"
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
  int currentSelectedOption = 0;
  bool positionCapture = true;
  bool confirmAnswer = false;
  int selectedOpt_quiz = -1;

  late Question myQuestion;

  // QUIZ END

  // Notifies listeners of changes
  void notify() {
    notifyListeners();
  }
}

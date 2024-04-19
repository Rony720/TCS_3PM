import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_auth_page/screen_quiz/controllers/question_controller.dart';
import 'package:flutter_auth_page/MLKIT/lowerposedetection/vision_detector_views/pose_detector_view.dart';

import 'components/body.dart';

// Define the quiz screen widget
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // Fluttter show the back button automatically
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
                onPressed: controller.nextQuestion, child: const Text("Skip")),
          ],
        ),
        body: Body(),
      ),
    );
  }
}

// Define the front camera widget
class front_camera extends StatelessWidget {
  const front_camera({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            const QuizScreen(),
            Container(
              alignment: Alignment.bottomCenter,
              child: const FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.2,
                child: PoseDetectorView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

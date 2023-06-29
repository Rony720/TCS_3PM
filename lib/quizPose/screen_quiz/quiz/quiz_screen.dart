import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/question_controller.dart';
import '../../vision_detector_views/pose_detector_view.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: 
      return Scaffold(
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
      );
  }
}

// Added by Rony
class front_camera extends StatelessWidget {
  const front_camera({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: 
      return Scaffold(
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
      );
  }
}
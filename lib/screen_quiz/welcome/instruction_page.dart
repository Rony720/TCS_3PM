import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../utils/color_utils.dart';
import '../quiz/components/progress_bar.dart';
import 'package:flutter_auth_page/screen_quiz/controllers/question_controller.dart';
import '../quiz/components/question_card.dart';
import '../quiz/quiz_screen.dart';

//// Define the main entry point of the application.
void main() {
  runApp(InstructionPage());
}

// Define the instruction page widget
class InstructionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Instruction Page'),
        // ),
        body: Stack(
          children: <Widget>[
            //SvgPicture.asset(
            //'assets/icons/bg.svg',
            // fit: BoxFit.cover,
            //width: double.infinity,
            //height: double.infinity,
            // ),
            Container(
              decoration: const BoxDecoration(color: Colors.white),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  //   child: ProgressBar(),
                  // ),
                  // const SizedBox(height: kDefaultPadding),
                  const Text(
                    'Instructions:',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  // Text(
                  //   'Welcome to the Instruction Page!',
                  //   style: TextStyle(
                  //     fontSize: 24,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                  Text(
                    'Follow these steps to complete the task:',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  InstructionStep(
                    // stepNumber: '1',
                    stepText:
                        'Step 1: Do squats to navigate through the options',
                    color: Colors.black, // Set the desired color for stepText
                  ),
                  InstructionStep(
                    // stepNumber: '2',
                    stepText: 'Step 2: Keep your phone steady',
                    color: Colors.black, // Set the desired color for stepText
                  ),
                  InstructionStep(
                    // stepNumber: '3',
                    stepText:
                        'Step 3: Stand atleast 1 metre away from the phone',
                    color: Colors.black, // Set the desired color for stepText
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Get.to(const front_camera()),
                    // Add your logic to handle button press
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Define the instruction step widget.
class InstructionStep extends StatelessWidget {
  // final String stepNumber;
  final String stepText;
  final Color color;

  const InstructionStep({required this.stepText, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          // Text(
          //   stepNumber,
          //   style: TextStyle(
          //       fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          // ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              stepText,
              style: TextStyle(
                  fontSize: 16,
                  color: color), // Apply the color to the stepText
            ),
          ),
        ],
      ),
    );
  }
}

// Define the integration widget
class Integration extends StatelessWidget {
  const Integration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            InstructionPage(),
          ],
        ),
      ),
    );
  }
}

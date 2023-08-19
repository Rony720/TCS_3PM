import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_auth_page/constants.dart';
import 'package:flutter_auth_page/screen_quiz/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth_page/screen_quiz/welcome/instruction_page.dart';

import '../../utils/color_utils.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Aligns the column contents in the center
            children: [
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(height: 16), // Adds some spacing between the elements
              Text(
                "${qnController.numOfCorrectAns}/${qnController.questions.length}",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(height: 32), // Adds some spacing between the elements
              // Adds some spacing between the elements
              ElevatedButton(
                onPressed: () {
                  // Navigation logic goes here
                  // You can use Get.to() or Get.off() to navigate to the desired page
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const WelcomeScreen()));
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Exit",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import '../../../main.dart';
import 'camera_view.dart';
import 'painters/pose_painter.dart';
import '../../../fruitcollection/game/fruitcollection.dart';

class PoseDetectorViewHand extends StatefulWidget {
  const PoseDetectorViewHand({super.key});

  @override
  State<StatefulWidget> createState() => _PoseDetectorViewHandState();
}

class _PoseDetectorViewHandState extends State<PoseDetectorViewHand> {
  final PoseDetector _poseDetector =
      PoseDetector(options: PoseDetectorOptions());
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() async {
    _canProcess = false;
    _poseDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      title: 'Pose Detector',
      customPaint: _customPaint,
      text: _text,
      onImage: (inputImage) {
        processImage(inputImage);
      },
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final poses = await _poseDetector.processImage(inputImage);

    // printing left eye y coordinate
    for (Pose pose in poses) {
      // FLAPPY
      if (changer.currentSelectedGame == "FLAPPY") {
        // to access specific landmarks  [ we need Shoulder]
        final rShoulder = pose.landmarks[PoseLandmarkType.rightShoulder];
        final lShoulder = pose.landmarks[PoseLandmarkType.leftShoulder];

        changer.isFlappyUp = false;
        changer.notify();

        if (rShoulder != null && lShoulder != null) {
          if (!changer.changeframe) {
            changer.changeframe = true;
            changer.flappyright = rShoulder.y;
            changer.flappyleft = lShoulder.y;
            changer.notify();
          }

          if (changer.changeframe) {
            if (changer.flappyright.abs() - rShoulder.y.abs() > 40 ||
                changer.flappyleft.abs() - lShoulder.y.abs() > 40) {
              print("shoulder up");
              changer.isFlappyUp = true;
              changer.notify();

              // New
              if (changer.flappyright.abs() - rShoulder.y.abs() > 40)
                changer.flappyright = rShoulder.y;
              if (changer.flappyleft.abs() - lShoulder.y.abs() > 40)
                changer.flappyleft = lShoulder.y;
              print("FLAPPY JUMPED");

              changer.notify();
            } else if (rShoulder.y.abs() > changer.flappyright.abs() ||
                lShoulder.y.abs() > changer.flappyleft.abs()) {
              if (rShoulder.y.abs() > changer.flappyright.abs())
                changer.flappyright = rShoulder.y;
              if (lShoulder.y.abs() > changer.flappyleft.abs())
                changer.flappyleft = lShoulder.y;
              changer.notify();
            }
          }
        }
      }
      // FLAPPY END

      // DINO
      if (changer.currentSelectedGame == "DINO") {
        // to access specific landmarks  [ we need wrist]
        final rightwrist = pose.landmarks[PoseLandmarkType.rightWrist];
        final leftwrist = pose.landmarks[PoseLandmarkType.leftWrist];

        if (rightwrist != null && leftwrist != null) {
          //finding horizontal distance between the right and left wrist
          double dx_wrist = rightwrist.x.abs() - leftwrist.x.abs();

          // Store value of first frame
          if (!changer.position) {
            changer.position = true;
            changer.dinoWrist = dx_wrist;
            changer.notify();
          }

          print(changer.dinoWrist);
          print(dx_wrist);

          changer.isDinoUp = false;
          changer.notify();
          //for the remaining frames, relative to initial wrist
          if (changer.position) {
            if (dx_wrist - changer.dinoWrist > 30) {
              print("Wrsit gap widened");
              changer.isDinoUp = true;
              changer.notify();
              // New
              changer.dinoWrist = dx_wrist;
              changer.notify();
              print("DINO JUMPED");
            } else if (changer.dinoWrist > dx_wrist) {
              changer.dinoWrist = dx_wrist;
              changer.notify();
            }
          }
        }
      }

      if (changer.currentSelectedGame == "FRUIT") {
        // to access specific landmarks  [ we need hip,knee,ankle]
        PoseLandmark rightHip = pose.landmarks[PoseLandmarkType.rightHip]!;
        PoseLandmark rightElbow = pose.landmarks[PoseLandmarkType.rightElbow]!;
        PoseLandmark rightShoulder =
            pose.landmarks[PoseLandmarkType.rightShoulder]!;

        PoseLandmark leftHip = pose.landmarks[PoseLandmarkType.leftHip]!;
        PoseLandmark leftElbow = pose.landmarks[PoseLandmarkType.leftElbow]!;
        PoseLandmark leftShoulder =
            pose.landmarks[PoseLandmarkType.leftShoulder]!;

        double rangle = calculateAngle(rightHip.x, rightHip.y, rightShoulder.x,
            rightShoulder.y, rightElbow.x, rightElbow.y);

        double langle = calculateAngle(leftHip.x, leftHip.y, leftShoulder.x,
            leftShoulder.y, leftElbow.x, leftElbow.y);

        if (rangle != null && langle != null) {
          if (changer.frame) {
            changer.frame = false;
            changer.fruitright = rangle;
            changer.fruitleft = langle;
            changer.notify();
          }

          if (!changer.frame) {
            if (rangle > changer.fruitright && rangle > 35) {
              print("Right Arm up");
              rightControl();
              print("BOY MOVED RIGHT");
            } else if (langle < changer.fruitleft && langle > 35) {
              print("Left Arm up");
              leftControl();
              print("BOY MOVED LEFT");
            }
            // New
            changer.fruitright = rangle;
            changer.fruitleft = langle;
            changer.notify();
          }
        }
      }
    }

    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      final painter = PosePainter(poses, inputImage.inputImageData!.size,
          inputImage.inputImageData!.imageRotation);
      _customPaint = CustomPaint(painter: painter);
    } else {
      _text = 'Poses found: ${poses.length}\n\n';
      // TODO: set _customPaint to draw landmarks on top of image
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  double calculateAngle(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    double angle = atan2(y1 - y2, x1 - x2) - atan2(y3 - y2, x3 - x2);
    angle = angle * 180 / pi;
    return angle;
  }
}

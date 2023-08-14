import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';

import '../../../main.dart';
import 'camera_view.dart';
import 'painters/pose_painter.dart';

class PoseDetectorView extends StatefulWidget {
  const PoseDetectorView({super.key});

  @override
  State<StatefulWidget> createState() => _PoseDetectorViewState();
}

class _PoseDetectorViewState extends State<PoseDetectorView> {
  int i = 1;
  double standing = 0;
  int squatno = 0;
  bool fixedAngle = false;
  bool squat = false;

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
    i++;
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
      if (!changer.isPauseMenu &&
          changer.currentSelectedGame == "FLAPPY" &&
          ((changer.sensitivity == 1) ||
              (changer.sensitivity == 0 && changer.isGamePaused == true))) {
        // to access specific landmarks  [ we need hip,knee,ankle]
        final leftHipPoint = pose.landmarks[PoseLandmarkType.leftHip];
        final leftKneePoint = pose.landmarks[PoseLandmarkType.leftKnee];
        final leftAnklePoint = pose.landmarks[PoseLandmarkType.leftAnkle];

        if (leftHipPoint != null &&
            leftKneePoint != null &&
            leftAnklePoint != null) {
          // slope of hip and knee
          double slopeA = (leftHipPoint.y - leftKneePoint.y) /
              (leftHipPoint.x - leftKneePoint.x);

          double slopeB = (leftAnklePoint.y - leftKneePoint.y) /
              (leftAnklePoint.x - leftKneePoint.x);

          double angle = atan((slopeB - slopeA) / (1 + slopeA * slopeB));

          // convert angle to radian

          double degree = angle * 180 / pi;
          changer.isFlappyUp = false;
          changer.notify();

          standing = 0;

          // check squat

          if (changer.positionCapture && !squat) {
            print("CURRENT ANGLE: ${degree.abs()}");
            if ((degree.abs() - standing.abs() > 30)) {
              squat = true;
              squatno++;
              changer.isFlappyUp = true;
              changer.notify();

              if (changer.sensitivity == 0) {
                changer.isGamePaused = false;
                changer.notify();
              }

              // print("SQUAT");
            } else {
              changer.isFlappyUp = false;
              changer.notify();
            }
          }

          // check for standing

          if (changer.positionCapture && squat) {
            print("CURRENT ANGLE: ${degree.abs()}");
            print("AVERAGE ANGLE: ${changer.poseStanding.abs()}");
            if ((degree.abs() - changer.poseStanding.abs() < 10)) {
              squat = false;
              // print("STAND");
            }
          }

          print("No of squats : $squatno");
        }
      }
      // FLAPPY END

      // DINO
      if (!changer.isPauseMenu &&
          changer.currentSelectedGame == "DINO" &&
          ((changer.sensitivity == 1) ||
              (changer.sensitivity == 0 && changer.isGamePaused == true))) {
        final rightHipPoint = pose.landmarks[PoseLandmarkType.rightHip];
        final rightKneePoint = pose.landmarks[PoseLandmarkType.rightKnee];
        final rightAnklePoint = pose.landmarks[PoseLandmarkType.rightAnkle];

        if (rightHipPoint != null &&
            rightKneePoint != null &&
            rightAnklePoint != null) {
          // slope of hip and knee
          double slopeA = (rightHipPoint.y - rightKneePoint.y) /
              (rightHipPoint.x - rightKneePoint.x);

          double slopeB = (rightAnklePoint.y - rightKneePoint.y) /
              (rightAnklePoint.x - rightKneePoint.x);

          double angle = atan((slopeB - slopeA) / (1 + slopeA * slopeB));

          // convert angle to radian

          double degree = angle * 180 / pi;
          changer.isDinoJump = false;
          changer.notify();

          standing = 0;

          // check squat

          if (changer.positionCaptureDinoLower && !squat) {
            print("CURRENT ANGLE: ${degree.abs()}");
            if ((degree.abs() - standing.abs() > 30)) {
              squat = true;
              squatno++;
              changer.isDinoJump = true;
              changer.notify();

              if (changer.sensitivity == 0) {
                changer.isGamePaused = false;
                changer.notify();
              }

              // print("SQUAT");
            } else {
              changer.isDinoJump = false;
              changer.notify();
            }
          }

          // check for standing

          if (changer.positionCaptureDinoLower && squat) {
            print("CURRENT ANGLE: ${degree.abs()}");
            print("AVERAGE ANGLE: ${changer.poseStandingDinoLower.abs()}");
            if ((degree.abs() - changer.poseStandingDinoLower.abs() < 10)) {
              squat = false;
              // print("STAND");
            }
          }

          print("No of squats : $squatno");
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
}

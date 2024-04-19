import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/API/users.dart';

import '../../API/base_client.dart';
import '../../main.dart';
import '../components/background_component.dart';
import '../components/bird_component.dart';
import '../components/bottomtube_component.dart';
import '../components/pausebutton.dart';
import '../components/toptube_component.dart';

FlappyBird flappyBird = FlappyBird();
late BirdComponent bird;

/// Represents the score data to be stored in Firebase.
class Score {
  // String? user;
  Fields? fields;
  // DateTime? createTime;
  //DateTime? updateTime;

  Score(
    //required this.name,
    this.fields,
    // required this.createTime,
    // required this.updateTime,
  );

  // factory DocumentElement.fromJson(Map<String, dynamic> json) =>
  //     DocumentElement(
  //       // name: json["name"],
  //       fields: Fields.fromJson(json["fields"]),
  //       ////createTime: DateTime.parse(json["createTime"]),
  //       //updateTime: DateTime.parse(json["updateTime"]),
  //     );

  Map<String, dynamic> toJson() => {
        // "name": name,
        "fields": fields?.toJson(),
        // "createTime": createTime?.toIso8601String(),
        // "updateTime": updateTime?.toIso8601String(),
      };
}

/// Represents the fields of the score data to be stored in Firebase.
class Fields {
  Dob? user;
  Firebase_score? score;
  Firebase_date_time date;
  //Phone? phone;

  Fields(this.user, this.score, this.date
      // required this.phone,
      // required this.uid,
      // required this.medical,
      // required this.username,
      );

  Map<String, dynamic> toJson() =>
      {"user": user, "score": score, "date": date.toJson()};
}

/// Represents the Firebase score.
class Firebase_score {
  int? integerValue;

  Firebase_score({
    required this.integerValue,
  });

  factory Firebase_score.fromJson(Map<String, dynamic> json) => Firebase_score(
        integerValue: json["integerValue"],
      );

  Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
      };
}

/// Represents the Firebase date and time.
class Firebase_date_time {
  DateTime dateTimeValue;

  Firebase_date_time({
    required this.dateTimeValue,
  });

  factory Firebase_date_time.fromJson(Map<String, dynamic> json) =>
      Firebase_date_time(
        dateTimeValue: json["stringValue"],
      );

  Map<String, dynamic> toJson() => {
        "stringValue": dateTimeValue.toIso8601String(),
      };
}

/// This class represents the Flappy Bird game.
class FlappyBird extends FlameGame with HasTappables, HasCollisionDetection {
  int score = 0;
  late TextComponent scoreComponent;
  String email = "";

  /// Fetches the user's email.
  Future fetch_user_email() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    final uid = user!.uid;

    var response = await MyBaseClient().get('');
    if (response != null) {
      var users = documentFromJson(response);
      debugPrint(users.documents!.length.toString());
      for (int i = 0; i < users.documents!.length; i++) {
        debugPrint("inside loop");
        if (users.documents![i].fields!.uid!.stringValue == uid.toString()) {
          debugPrint("GOT IT");

          email = users.documents![i].fields!.email!.stringValue.toString();
          debugPrint(email);

          debugPrint(email);
          return email;
        }
      }
    }
  }

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    changer.isGamePaused = true;
    changer.isPauseMenu = false;
    changer.sensitivity = -1;
    changer.notify();
    // Set Game Selected as Flappy
    changer.currentSelectedGame = "FLAPPY";
    changer.notify();

    // Pause Button
    add(PauseButton());

    // Load audio
    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.loadAll(
        ['flappySound.mp3', 'flappyReward.mpeg', 'flappyBackground.mp3']);

    FlameAudio.bgm.play('flappyBackground.mp3');

    // Background
    add(BackgroundComponent());

    // Bird
    bird = BirdComponent();
    add(bird);

    // Bottomtube , Total Gap is 0.60
    add(BottomtubeComponent(0.30));

    // Toptube
    add(ToptubeComponent(0.30));

    // Score

    Future fetch_user_email() async {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final User? user = auth.currentUser;
      final uid = user!.uid;

      var response = await MyBaseClient().get('');
      if (response != null) {
        var users = documentFromJson(response);
        debugPrint(users.documents!.length.toString());
        for (int i = 0; i < users.documents!.length; i++) {
          debugPrint("inside loop");
          if (users.documents![i].fields!.uid!.stringValue == uid.toString()) {
            debugPrint("GOT IT");

            email = users.documents![i].fields!.email!.stringValue.toString();
            debugPrint(email);

            debugPrint(email);
            return email;
          }
        }
      }
    }

    TextPaint scoreComponentPaint = TextPaint(
        style: const TextStyle(
            fontSize: 60,
            color: Color.fromARGB(255, 246, 218, 5),
            fontFamily: 'RubikMicrobe',
            fontWeight: FontWeight.w700));

    scoreComponent = TextComponent(
        text: "${score}",
        position: Vector2(size[0] / 2, 0),
        textRenderer: scoreComponentPaint);

    add(scoreComponent);
    add(PauseButton());

    // Overlay - StartMenu
    changer.isGamePaused = true;
    changer.notify();
    overlays.add('StartMenu');
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Score Update
    scoreComponent.text = '${score}';

    // Game Paused
    if (changer.isGamePaused) return;

    // face
    if (changer.isFlappyUp) {
      changer.isFlappyUp = false;
      changer.notify();
      bird.position.y -= 70;
    }
  }

  /// Resets the game state
  void reset(bool should_update_firestore) async {
    int scoreFirestore = score;
    score = 0;
    bird.position.y = size[1] / 2;

    // Remove all components
    children.forEach((child) {
      if (child is ToptubeComponent || child is BottomtubeComponent)
        remove(child);
    });

    // Add the inital tubes
    add(ToptubeComponent(0.30));
    add(BottomtubeComponent(0.30));

    String user_email = await fetch_user_email() as String;
    Firebase_score scoree = Firebase_score(
      integerValue: scoreFirestore,
    );
    Dob user = Dob(
      stringValue: user_email,
    );
    Firebase_date_time datee =
        Firebase_date_time(dateTimeValue: DateTime.now());

    Fields fields = Fields(user, scoree, datee);
    Score outer_score = Score(fields);
    if (should_update_firestore) {
      if (changer.currentSelectedBodyPart == "HEAD") {
        var response = await MyBaseClient().post(
            'head',
            "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/HFlappy/",
            outer_score);
      } else if (changer.currentSelectedBodyPart == "LEG") {
        var response = await MyBaseClient().post(
            'leg',
            "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/LFlappy/",
            outer_score);
      } else if (changer.currentSelectedBodyPart == "HAND") {
        var response = await MyBaseClient().post(
            'hand',
            "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/UFlappy/",
            outer_score);
      }
    }
  }

  /// Removes all game components and exits the game.
  void removeAllExit() {
    children.forEach((child) {
      remove(child);
    });
  }
}

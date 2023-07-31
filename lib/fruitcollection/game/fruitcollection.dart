import 'dart:async';
import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_texturepacker/flame_texturepacker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/API/users.dart';

import '../../main.dart';
import '../components/background_component.dart';
import '../components/boy_component.dart';
import '../components/fruit_component.dart';
import '../components/pausebutton_component.dart';
import '../../API/base_client.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late BoyComponent boy;

late String positionReachingAfterRun;
late bool boyRemoved;
late bool runLeft;
late bool runRight;
late bool busy;
late double distanceRun;

late String currentPosition;
late String head;

late PauseButton pauseButton;

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

class FruitCollection extends FlameGame
    with HasTappables, HasCollisionDetection {
  late TextComponent scoreComponent;
  late TextComponent remainingLifeComponent;
  late SpriteAnimationComponent boyWalking;
  late int fruitCollected;
  late int fruitMissed;
  bool isGamePaused = true;
  String email = "";

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

    // Set Selected Game as FRUIT
    changer.currentSelectedGame = "FRUIT";
    changer.notify();

    // Initialiszation
    positionReachingAfterRun = "";
    boyRemoved = false;
    runLeft = false;
    runRight = false;
    busy = false;
    distanceRun = 0;

    currentPosition = "CENTER"; // LEFT OR CENTER OR RIGHT

    head = "RIGHT"; // LEFT OR RIGHT

    fruitCollected = 0;
    fruitMissed = 0;
    // Background
    add(BackgroundComponent());

    // Fruit every 2 seconds
    add(TimerComponent(
        period: 5,
        repeat: true,
        onTick: () async {
          if (!isGamePaused) {
            // random number
            var random = Random();
            var positionIndex = random.nextInt(3);
            add(FruitComponent(positionIndex));
          }
        }));

    // Boy
    boy = BoyComponent();
    add(boy);
    // Text Component for score
    TextPaint scoreText = TextPaint(
      style: const TextStyle(
          color: Color.fromARGB(255, 72, 33, 243),
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );

    scoreComponent = TextComponent(
        text: "SCORE :$fruitCollected",
        position: Vector2(size[0] * .03, size[1] * .1),
        textRenderer: scoreText);

    add(scoreComponent);

    // Text Compoenent for remaining life

    TextPaint remainingLifeText = TextPaint(
      style: const TextStyle(
          color: Color.fromARGB(255, 243, 33, 33),
          fontSize: 30,
          fontWeight: FontWeight.bold),
    );
    remainingLifeComponent = TextComponent(
        text: "LIFE :${5 - fruitMissed}",
        position: Vector2(size[0] * .35, size[1] * .2),
        textRenderer: remainingLifeText);

    add(remainingLifeComponent);

    // Animation

    final spritesheet =
        await fromJSONAtlas('boy_sprite.png', 'boy_sprite.json');

    SpriteAnimation walk =
        SpriteAnimation.spriteList(spritesheet, stepTime: 0.1);
    boyWalking = SpriteAnimationComponent()
      ..animation = walk
      ..x = size[0] * 0.4
      ..y = size[1] / 1.28
      ..size = Vector2(size[1] / 5, size[1] / 5.5);

    // Pause Button
    add(PauseButton());
    // overlay
    overlays.add('StartMenu');
  }

  @override
  void update(double dt) async {
    super.update(dt);

    // End Game
    if (isGamePaused) return;

    // update score
    final newScore = "SCORE :${fruitCollected}";
    scoreComponent.text = newScore;

    // update remaining life

    final newLife = "LIFE :${5 - fruitMissed}";
    remainingLifeComponent.text = newLife;

    // To remove boy character

    if (boyRemoved) {
      if (runLeft) {
        if (head == "RIGHT") {
          head = "LEFT";
          boy.flipHorizontally();
          boyWalking.flipHorizontally();
          //flip problem

          boy.x += size[0] / 10;
          boyWalking.x += size[0] / 10;
        }
      } else {
        // runRight
        if (head == "LEFT") {
          head = "RIGHT";
          boy.flipHorizontally();
          boyWalking.flipHorizontally();

          boy.x -= size[0] / 10;
          boyWalking.x -= size[0] / 10;
        }
      }
      remove(boy);
      add(boyWalking);
      boyRemoved = false;
    }

    // Left Movements

    if (runLeft &&
        distanceRun < ((size[0] * .7 - size[0] * .4)) &&
        contains(boyWalking)) {
      distanceRun += 5;
      boyWalking.x -= 5;
    }

    if (runLeft && distanceRun >= (size[0] * .7 - size[0] * .4)) {
      boy.x = boyWalking.x;
      print("boyWalking.x (LEFT)");
      print(boyWalking.x);
      print("boy.x(LEFT)");
      print(boy.x);
      busy = false; // Boy reached at the place
      remove(boyWalking);
      add(boy);
      distanceRun = 0;
      runLeft = false;

      currentPosition = positionReachingAfterRun;
    }

    // Right Movements

    if (runRight &&
        distanceRun < (size[0] * .7 - size[0] * .4) &&
        contains(boyWalking)) {
      distanceRun += 5;
      boyWalking.x += 5;
    }

    if (runRight && distanceRun >= (size[0] * .7 - size[0] * .4)) {
      boy.x = boyWalking.x;
      print("boyWalking.x (RIGHT)");
      print(boyWalking.x);
      print("boy.x(RIGHT)");
      print(boy.x);
      busy = false; // Boy reached at the place

      remove(boyWalking);
      add(boy);
      distanceRun = 0;
      runRight = false;

      currentPosition = positionReachingAfterRun;
    }
  }

  void reset(bool should_update_firestore) async {
    print("reset called");

    String user_email = await fetch_user_email() as String;
    Firebase_score score = Firebase_score(
      integerValue: fruitCollected,
    );
    Dob user = Dob(
      stringValue: user_email,
    );
    Firebase_date_time datee =
        Firebase_date_time(dateTimeValue: DateTime.now());

    Fields fields = Fields(user, score, datee);
    Score outer_score = Score(fields);
    if (should_update_firestore) {
      var response = await MyBaseClient().post(
          'score',
          "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/HFruit/",
          outer_score);
    }
    // Remove all components
    fruitCollected = 0;
    fruitMissed = 0;
    children.forEach((child) {
      if (child is FruitComponent) remove(child);
    });

    // Add the inital tubes
  }

  void removeAllExit() {
    children.forEach((child) {
      remove(child);
    });
  }
}

void leftControl() {
  print("inisde leftcontrol");
  print(currentPosition);
  print(busy);
  if ((currentPosition == "CENTER" || currentPosition == "RIGHT") && !busy) {
    distanceRun = 0;
    boyRemoved = true;
    runLeft = true;
    busy = true;

    // New position
    currentPosition == "CENTER"
        ? positionReachingAfterRun = "LEFT"
        : positionReachingAfterRun = "CENTER";

    currentPosition = "";
    print(positionReachingAfterRun);
  }
}

void rightControl() {
  print("inside right");
  print(currentPosition);
  print(busy);
  if ((currentPosition == "CENTER" || currentPosition == "LEFT") && !busy) {
    distanceRun = 0;
    boyRemoved = true;
    runRight = true;
    busy = true;

    // New position
    currentPosition == "CENTER"
        ? positionReachingAfterRun = "RIGHT"
        : positionReachingAfterRun = "CENTER";

    currentPosition = "";
    print(positionReachingAfterRun);
  }
}

 /*Dob score=  Dob(
        stringValue: "score",
    );
     Dob user=  Dob(
        stringValue: "user",
    );

    Fields fields = Fields(score, user);
    Score outer_score = Score(fields);

    var response = await MyBaseClient().post(
      "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/HFruit/",outer_score
    );*/

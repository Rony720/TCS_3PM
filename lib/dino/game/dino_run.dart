import 'package:firebase_auth/firebase_auth.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:hive/hive.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';

import '../../API/base_client.dart';
import '../../API/users.dart';
import '../../main.dart';
import '../game/dino.dart';
import '../widgets/hud.dart';
import '../models/settings.dart';
import '../game/audio_manager.dart';
import '../game/enemy_manager.dart';
import '../models/player_data.dart';
import '../widgets/pause_menu.dart';
import '../widgets/game_over_menu.dart';

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

// This is the main flame game class.
class DinoRun extends FlameGame with TapDetector, HasCollisionDetection {
  // List of all the image assets.
  static const _imageAssets = [
    'DinoSprites - tard.png',
    'AngryPig/Walk (36x30).png',
    'Bat/Flying (46x30).png',
    'Rino/Run (52x34).png',
    'parallax/plx-1.png',
    'parallax/plx-2.png',
    'parallax/plx-3.png',
    'parallax/plx-4.png',
    'parallax/plx-5.png',
    'parallax/plx-6.png',
  ];

  // List of all the audio assets.
  static const _audioAssets = [
    '8BitPlatformerLoop.wav',
    'hurt7.wav',
    'jump14.wav',
  ];

  late Dino _dino;
  late Settings settings;
  late PlayerData playerData;
  late EnemyManager _enemyManager;

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

  // This method get called while flame is preparing this game.
  @override
  Future<void> onLoad() async {
    changer.isGamePaused = true;
    changer.isPauseMenu = false;
    changer.sensitivity = -1;
    changer.notify();
    // SET SELECTED GAME AS DINO
    changer.currentSelectedGame = "DINO";
    changer.notify();

    /// Read [PlayerData] and [Settings] from hive.
    playerData = await _readPlayerData();
    settings = await _readSettings();

    /// Initilize [AudioManager].
    await AudioManager.instance.init(_audioAssets, settings);

    // Start playing background music. Internally takes care
    // of checking user settings.
    AudioManager.instance.startBgm('8BitPlatformerLoop.wav');

    // Cache all the images.
    await images.loadAll(_imageAssets);

    // Set a fixed viewport to avoid manually scaling
    // and handling different screen sizes.
    camera.viewport = FixedResolutionViewport(Vector2(360, 180));

    /// Create a [ParallaxComponent] and add it to game.
    final parallaxBackground = await loadParallaxComponent(
      [
        ParallaxImageData('parallax/plx-1.png'),
        ParallaxImageData('parallax/plx-2.png'),
        ParallaxImageData('parallax/plx-3.png'),
        ParallaxImageData('parallax/plx-4.png'),
        ParallaxImageData('parallax/plx-5.png'),
        ParallaxImageData('parallax/plx-6.png'),
      ],
      baseVelocity: Vector2(5, 0),
      velocityMultiplierDelta: Vector2(1.4, 0),
    );
    add(parallaxBackground);

    return super.onLoad();
  }

  /// This method add the already created [Dino]
  /// and [EnemyManager] to this game.
  void startGamePlay() {
    _dino = Dino(images.fromCache('DinoSprites - tard.png'), playerData);
    _enemyManager = EnemyManager();

    add(_dino);
    add(_enemyManager);
  }

  // This method remove all the actors from the game.
  void _disconnectActors() {
    _dino.removeFromParent();
    _enemyManager.removeAllEnemies();
    _enemyManager.removeFromParent();
  }

  // This method reset the whole game world to initial state.
  void reset(bool should_update_firestore) async {
    int firestoreScore = playerData.currentScore;

    // First disconnect all actions from game world.
    _disconnectActors();

    // Reset player data to inital values.
    playerData.currentScore = 0;
    playerData.lives = 5;

    String user_email = await fetch_user_email() as String;
    Firebase_score scoree = Firebase_score(
      integerValue: firestoreScore,
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
            "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/HDino/",
            outer_score);
      } else if (changer.currentSelectedBodyPart == "LEG") {
        var response = await MyBaseClient().post(
            'leg',
            "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/LDino/",
            outer_score);
      } else if (changer.currentSelectedBodyPart == "HAND") {
        var response = await MyBaseClient().post(
            'hand',
            "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/UDino/",
            outer_score);
      }
    }
  }

  // This method gets called for each tick/frame of the game.
  @override
  void update(double dt) {
    if (changer.isGamePaused == true) return;

    // If number of lives is 0 or less, game is over.
    if (playerData.lives <= 0) {
      overlays.add(GameOverMenu.id);
      overlays.remove(Hud.id);
      // pauseEngine();
      AudioManager.instance.pauseBgm();
      changer.isGamePaused = true;
      changer.notify();
    }
    super.update(dt);

    if (changer.isDinoJump) {
      if (overlays.isActive(Hud.id)) {
        _dino.jump();
        changer.isDinoJump = false;
        changer.notify();
        //print("working");
      }
    }
  }

  // This will get called for each tap on the screen.
  @override
  // void onTapDown(TapDownInfo info) {
  //   // Make dino jump only when game is playing.
  //   // When game is in playing state, only Hud will be the active overlay.
  //   if (overlays.isActive(Hud.id)) {
  //     _dino.jump();
  //   }
  //   super.onTapDown(info);
  // }

  /// This method reads [PlayerData] from the hive box.
  Future<PlayerData> _readPlayerData() async {
    final playerDataBox = await Hive.openBox<PlayerData>(
        '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.PlayerDataBox');
    final playerData = playerDataBox.get(
        '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.PlayerData');

    // If data is null, this is probably a fresh launch of the game.
    if (playerData == null) {
      // In such cases store default values in hive.
      await playerDataBox.put(
          '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.PlayerData',
          PlayerData());
    }

    // Now it is safe to return the stored value.
    return playerDataBox.get(
        '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.PlayerData')!;
  }

  /// This method reads [Settings] from the hive box.
  Future<Settings> _readSettings() async {
    final settingsBox = await Hive.openBox<Settings>(
        '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.SettingsBox');
    final settings = settingsBox.get(
        '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.Settings');

    // If data is null, this is probably a fresh launch of the game.
    if (settings == null) {
      // In such cases store default values in hive.
      await settingsBox.put(
        '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.Settings',
        Settings(bgm: true, sfx: true),
      );
    }

    // Now it is safe to return the stored value.
    return settingsBox.get(
        '${changer.hiveBoxName[changer.currentSelectedBodyPart]}.Settings')!;
  }

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        // On resume, if active overlay is not PauseMenu,
        // resume the engine (lets the parallax effect play).
        if (!(overlays.isActive(PauseMenu.id)) &&
            !(overlays.isActive(GameOverMenu.id))) {
          // resumeEngine();
          changer.isGamePaused = false;
          changer.notify();
        }
        break;
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
      case AppLifecycleState.inactive:
        // If game is active, then remove Hud and add PauseMenu
        // before pausing the game.
        if (overlays.isActive(Hud.id)) {
          overlays.remove(Hud.id);
          overlays.add(PauseMenu.id);
        }
        // pauseEngine();
        changer.isGamePaused = true;
        changer.notify();
        break;
    }
    super.lifecycleStateChange(state);
  }
}

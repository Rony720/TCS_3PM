// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../dino/dino_game_main.dart';
import '../flappybird/game/flappy_main.dart';
import '../fruitcollection/game/fruitcollection_main.dart';
import '../main.dart' as main;
import '../quiz_notimer/screens/main_menu.dart';

// ignore: camel_case_types
class GamesLower extends StatefulWidget {
  const GamesLower({super.key});

  @override
  State<GamesLower> createState() => _GamesLowerState();
}

class _GamesLowerState extends State<GamesLower> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('LOWER'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Material(
                    color: Colors.white,
                    child: SizedBox(height: h / 10, width: w / 2)),
                Flexible(
                  child: Container(
                    child: Material(
                      color: Colors.cyan,
                      //elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          main.changer.currentSelectedBodyPart = "LEG";
                          main.changer.notify();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FlappyFaceDetect(),
                            ),
                          );
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: AssetImage('assets/images/flappy.jpg'),
                            height: h / 4.5,
                            width: w / 2.5,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: h / 35,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Flappy Bird',
                                style: TextStyle(
                                    fontSize: h / 40, color: Colors.black),
                                textAlign: TextAlign.center,
                              ))
                        ]),
                      ),
                    ),
                  ),
                ),
                Material(
                    color: Colors.white,
                    child: SizedBox(height: h / 10, width: w / 2)),
                Flexible(
                  child: Container(
                    child: Material(
                      color: Colors.cyan,
                      //elevation: 8,

                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          main.changer.currentSelectedBodyPart = "LEG";
                          main.changer.notify();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainMenu(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: AssetImage('assets/images/quiz.png'),
                              height: h / 4.5,
                              width: w / 2.5,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: h / 35,
                            ),
                            Text(
                              'Quiz',
                              style: TextStyle(
                                  fontSize: h / 40, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              Material(
                  color: Colors.white, child: SizedBox(height: 10, width: 10)),
              Column(
                children: [
                  Material(
                      color: Colors.white,
                      child: SizedBox(height: h / 10, width: w / 3)),
                  Flexible(
                    child: Container(
                      child: Material(
                        color: Colors.cyan,
                        // elevation: 8,
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                      color: Colors.white,
                      child: SizedBox(height: h / 5, width: w / 3)),
                  Flexible(
                      child: Container(
                          child: Material(
                    color: Colors.cyan,
                    // elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        main.changer.currentSelectedBodyPart = "LEG";
                        main.changer.notify();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DinoRunFace(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage('assets/images/dino.jpg'),
                            height: h / 4.5,
                            width: w / 2.5,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: h / 35,
                          ),
                          Text(
                            'Dino Run',
                            style: TextStyle(
                                fontSize: h / 40, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}



/*import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../dino/dino_game_main.dart';
import '../flappybird/game/flappy_main.dart';
import '../fruitcollection/game/fruitcollection_main.dart';
import '../main.dart' as main;
import '../quiz_notimer/screens/main_menu.dart';

// ignore: camel_case_types
class GamesLower extends StatefulWidget {
  const GamesLower({super.key});

  @override
  State<GamesLower> createState() => _GamesLowerState();
}

class _GamesLowerState extends State<GamesLower> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('LOWER'),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [
                Material(
                    color: Colors.white,
                    child: SizedBox(height: 100, width: 100)),
                Flexible(
                  child: Container(
                    child: Material(
                      color: Colors.white,
                      //elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          main.changer.currentSelectedBodyPart = "LEG";
                          main.changer.notify();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FlappyFaceDetect(),
                            ),
                          );
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Ink.image(
                            image: AssetImage('assets/images/flappy.jpg'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Flappy Bird',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
                Material(
                    color: Colors.white,
                    child: SizedBox(height: 100, width: 200)),
              ]),
              Material(
                  color: Colors.white, child: SizedBox(height: 10, width: 10)),
              Column(
                children: [
                  Material(
                      color: Colors.white,
                      child: SizedBox(height: 100, width: 100)),
                  Flexible(
                    child: Container(
                      child: Material(
                        color: Colors.white,
                        // elevation: 8,
                        borderRadius: BorderRadius.circular(20),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {
                            main.changer.currentSelectedBodyPart = "LEG";
                            main.changer.notify();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainMenu(),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Ink.image(
                                image: AssetImage('assets/images/quiz.png'),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'Quiz',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                      color: Colors.white,
                      child: SizedBox(height: 100, width: 100)),
                  Flexible(
                      child: Container(
                          child: Material(
                    color: Colors.white,
                    // elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        main.changer.currentSelectedBodyPart = "LEG";
                        main.changer.notify();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DinoRunFace(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Ink.image(
                            image: AssetImage('assets/images/dino.jpg'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Dino Run',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  )))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}*/



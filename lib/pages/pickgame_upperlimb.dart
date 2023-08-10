// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../dino/dino_game_main.dart';
import '../flappybird/game/flappy_main.dart';
import '../fruitcollection/game/fruitcollection_main.dart';
import '../main.dart' as main;

// ignore: camel_case_types
class GamesUpper extends StatefulWidget {
  const GamesUpper({super.key});

  @override
  State<GamesUpper> createState() => _GamesUpperState();
}

class _GamesUpperState extends State<GamesUpper> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('UPPER'),
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
                          main.changer.currentSelectedBodyPart = "HAND";
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
                          main.changer.currentSelectedBodyPart = "HAND";
                          main.changer.notify();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FruitCollectionFace(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Ink.image(
                              image: AssetImage('assets/images/fruit.jpg'),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Fruit Collection',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
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
                      child: SizedBox(height: 100, width: 100)),
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
                        main.changer.currentSelectedBodyPart = "HAND";
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
}

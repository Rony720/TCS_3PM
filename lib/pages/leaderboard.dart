import 'package:flutter/material.dart';
import '../pages/headprogress.dart';
import '../pages/upperprogress.dart';

import '../pages/lowerprogress.dart';
import '../main.dart';


class progressPage extends StatefulWidget {
  @override
  State<progressPage> createState() => _progressPageState();
}

class _progressPageState extends State<progressPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Check'),
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
                      color: Colors.cyan,
                      //elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          // changer.currentSelectedBodyPart = "HEAD";
                          // changer.notify();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HeadChart(),
                            ),
                          );
                        },
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          // Ink.image(
                          //   //image: AssetImage('assets/images/flappy.jpg'),
                          //   height: 150,
                          //   width: 150,
                          //   fit: BoxFit.cover,
                          // ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Head',
                            style: TextStyle(fontSize: 20, color: Colors.white),
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
                      color: Colors.cyan,
                      //elevation: 8,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          // changer.currentSelectedBodyPart = "HEAD";
                          // changer.notify();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LowerChart(),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Ink.image(
                            //   //image: AssetImage('assets/images/fruit.jpg'),
                            //   height: 150,
                            //   width: 150,
                            //   fit: BoxFit.cover,
                            // ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Lower Limb',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                    color: Colors.cyan,
                    // elevation: 8,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: InkWell(
                      splashColor: Colors.black26,
                      onTap: () {
                        // changer.currentSelectedBodyPart = "HEAD";
                        // changer.notify();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpperChart(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Ink.image(
                          //   //image: AssetImage('assets/images/dino.jpg'),
                          //   height: 150,
                          //   width: 150,
                          //   fit: BoxFit.cover,
                          // ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Upper Limb',
                            style: TextStyle(fontSize: 20, color: Colors.white),
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

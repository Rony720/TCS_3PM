/*import 'package:flutter/material.dart';
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
                            builder: (context) => UpperChart
                            (),
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
*/



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
       body: Padding(
        padding: EdgeInsets.only(top: 80),
       child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Image.asset(
              'assets/images/chart.png',
              width: w * 200 ,
             height: h*0.2,
            ),
            SizedBox(height:h*0.07),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/headchart');
              },
              style : ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                textStyle: TextStyle(fontSize:20),
              ),
              child: Text(' Head Chart'),
            ),
            SizedBox(height : h*0.02),
            ElevatedButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/upperchart');
              },
              style : ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                textStyle: TextStyle(fontSize:20),
              ),
              child: Text('Upper Chart'),
            ),
            SizedBox(height:h*0.02),
            ElevatedButton(
              onPressed: () {
                 Navigator.pushNamed(context, '/lowerchart');
              },
              style : ElevatedButton.styleFrom(
                padding: EdgeInsets.all(16),
                textStyle: TextStyle(fontSize:20),
              ),
              child: Text('Lower Chart'),
            ),
          ],
        ),
      ),
       ),
    );
  }
}


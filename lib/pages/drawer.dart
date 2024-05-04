import 'package:flutter/material.dart';
import 'dashboard.dart';
class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
            0.3,
            1
          ],
              colors: [
            Colors.white,
            Colors.cyan
            // hexStringToColor(Colors.cyan),
            // hexStringToColor('20797C'),
            // hexStringToColor('209E5A')
          ])),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/gamer.png'),
                )),
          ),
          FutureBuilder(future: DashboardPage().fetch(), builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator while fetching
              } else if (snapshot.hasError) {
                return Text('Error fetching username');
              } else {
                return Text(
                  snapshot.data ?? 'User',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontStyle: FontStyle.normal,
                  ),
                );
              }
          }),
        ],
      ),
    );
  }
}

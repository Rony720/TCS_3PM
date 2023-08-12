import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_auth_page/src/widgets/placeholder.dart';
import 'package:flutter_auth_page/pages/drawer.dart';
import 'package:flutter_auth_page/pages/pickgame_head.dart';
import 'package:flutter_auth_page/pages/pickgame_lowerlimb.dart';
import 'package:flutter_auth_page/pages/pickgame_upperlimb.dart';
import 'package:flutter_auth_page/pages/settings.dart';
import 'package:flutter_auth_page/pages/login.dart';
import 'package:flutter_auth_page/pages/signup.dart';

import '../pages/color_utils.dart';
import 'leaderboard.dart';
import 'dashboard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.leaderboard) {
      container = progressPage();
    } else if (currentPage == DrawerSections.pickgame) {
      container = Games();
    } else if (currentPage == DrawerSections.pickgame_upper) {
      container = GamesUpper();
    } else if (currentPage == DrawerSections.pickgame_lower) {
      container = GamesLower();
    } else if (currentPage == DrawerSections.login) {
      container = Login();
    }

    /*else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    }*/
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 28, 127, 232),
        title: Text("Physioplay"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.cyan,
            /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                color: Colors.cyan,)/*<Color>[
                  Color.fromARGB(255, 33, 150, 243),
                  Color(0xFF059362)
                ]*/,*/
          ),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Progress", Icons.people_alt_outlined,
              currentPage == DrawerSections.leaderboard ? true : false),
          menuItem(3, "Head", Icons.games_outlined,
              currentPage == DrawerSections.pickgame ? true : false),
          menuItem(4, "Upper limb", Icons.games_outlined,
              currentPage == DrawerSections.pickgame_upper ? true : false),
          menuItem(5, "Lower limb", Icons.games_outlined,
              currentPage == DrawerSections.pickgame_lower ? true : false),
          const Divider(),
          Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: Text("Logout"),
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  print("Signed Out Success");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ))
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.leaderboard;
            } else if (id == 3) {
              currentPage = DrawerSections.pickgame;
            } else if (id == 4) {
              currentPage = DrawerSections.pickgame_upper;
            } else if (id == 5) {
              currentPage = DrawerSections.pickgame_lower;
            }

            /*else if (id == 4) {
              currentPage = DrawerSections.settings;
            }*/
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  leaderboard,
  pickgame, // head
  pickgame_upper,
  pickgame_lower,
  //settings,
  login,
}

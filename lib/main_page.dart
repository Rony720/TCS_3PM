// This page is mainly for fireabaseAuth change and deciding which page should be present

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_page/pages/drawerlist.dart';
import 'package:flutter_auth_page/pages/welcome.dart';

// Define the main page widget
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint("Inside main_page, user has data");
              return const HomeScreen();
            } else {
              debugPrint("Inside main_page, user data not available");
              return Welcome();
            }
          }),
    );
  }
}

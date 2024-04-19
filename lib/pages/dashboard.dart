import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../API/base_client.dart';
import '../API/users.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';

/// DashboardPage is a stateless widget that displays personal information
/// of the authenticated user in a well-structured layout.
class DashboardPage extends StatelessWidget {
  //AuthService authService = AuthService();

  @override

  //final GlobalKey<ExpansiSonTileCardState> cardA = new GlobalKey();
  //final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  String username = 'null', med = 'null', agee = 'null', email = 'null';
  String phone = "null";
//aync function to fetch user data
  Future fetch() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    final User? user = auth.currentUser;
    final uid = user!.uid;

    print("UID IS ${uid}");
    print("UID IS ${uid}");
    print("UID IS ${uid}");
    print("UID IS ${uid}");

    var response = await MyBaseClient().get('');
    if (response != null) {
      var users = documentFromJson(response);
      debugPrint(users.documents!.length.toString());
      for (int i = 0; i < users.documents!.length; i++) {
        debugPrint("inside loop");
        if (users.documents![i].fields!.uid!.stringValue == uid.toString()) {
          debugPrint("GOT IT");
          username =
              users.documents![i].fields!.username!.stringValue.toString();
          debugPrint(username);

          med = users.documents![i].fields!.medical!.stringValue.toString();
          debugPrint(med);
          email = users.documents![i].fields!.email!.stringValue.toString();
          debugPrint(email);
          agee = users.documents![i].fields!.dob!.stringValue!;
          debugPrint(agee);
          phone = users.documents![i].fields!.phone!.integerValue.toString();
          debugPrint(phone);
          debugPrint(username);
          debugPrint(med);
          debugPrint(phone);
          debugPrint(email);
          return username;
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 100, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(5, 5))
                      ]),
                  child:
                      /*const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),*/

                      Container(
                    //margin: const EdgeInsets.only(bottom: 10),
                    height: 70,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/gamer.png'),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: FutureBuilder(
                  future: fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text("Loading data...Please wait");
                    return Text(username);
                  },
                )),

                /*Text(
                     "username",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),*/
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.blue,
                                    tiles: [
                                      ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text("Date of Birth"),
                                          subtitle: FutureBuilder(
                                            future: fetch(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done)
                                                return Text(
                                                    "Loading data...Please wait");
                                              return Text(agee);
                                            },
                                          )
                                          //subtitle: Text(age),
                                          ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.medical_information),
                                        title: Text("Medical Condition"),
                                        subtitle: FutureBuilder(
                                          future: fetch(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text(
                                                  "Loading data...Please wait");
                                            return Text(med);
                                          },
                                        ),
                                        //subtitle: Text(med),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.email),
                                        title: Text("Email"),
                                        subtitle: FutureBuilder(
                                          future: fetch(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text(
                                                  "Loading data...Please wait");
                                            return Text(email);
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.phone),
                                        title: Text("Phone"),
                                        subtitle: FutureBuilder(
                                          future: fetch(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text(
                                                  "Loading data...Please wait");
                                            return Text(phone);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ]))
        ],
      ),
    ));
  }
}

/*import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:expansion_tile_card/expansion_tile_card.dart';

class DashboardPage extends StatelessWidget {
  //AuthService authService = AuthService();

  @override

  //final GlobalKey<ExpansiSonTileCardState> cardA = new GlobalKey();
  //final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  String username = 'a', med = 'a', agee = 'a', email = 'a';
  int age = 0;

  fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc((firebaseUser.uid))
          .get()
          .then((ds) {
        username = ds.data()!['username'] ?? [];
        // print(username);
        age = ds.data()!['age'] ?? [];
        med = ds.data()!['medical condition'] ?? [];
        email = ds.data()!['email'] ?? [];
        agee = age.toString();
        //print(username);
      }).catchError((e) {
        print(e);
      });
      return (username);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: Offset(5, 5))
                      ]),
                  child: const Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                    child: FutureBuilder(
                  future: fetch(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return Text("Loading data...Please wait");
                    return Text(username);
                  },
                )),

                /*Text(
                     "username",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),*/
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.blue,
                                    tiles: [
                                      ListTile(
                                          leading: Icon(Icons.date_range),
                                          title: Text("Date of Birth"),
                                          subtitle: FutureBuilder(
                                            future: fetch(),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState !=
                                                  ConnectionState.done)
                                                return Text(
                                                    "Loading data...Please wait");
                                              return Text(agee);
                                            },
                                          )
                                          //subtitle: Text(age),
                                          ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.medical_information),
                                        title: Text("Medical Condition"),
                                        subtitle: FutureBuilder(
                                          future: fetch(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text(
                                                  "Loading data...Please wait");
                                            return Text(med);
                                          },
                                        ),
                                        //subtitle: Text(med),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.email),
                                        title: Text("Email"),
                                        subtitle: FutureBuilder(
                                          future: fetch(),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState !=
                                                ConnectionState.done)
                                              return Text(
                                                  "Loading data...Please wait");
                                            return Text(email);
                                          },
                                        ),
                                      ),
                                      const ListTile(
                                        leading: Icon(Icons.phone),
                                        title: Text("Phone"),
                                        subtitle: Text("99--99876-56"),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ]))
        ],
      ),
    ));
  }
}*/

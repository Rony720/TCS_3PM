import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth_page/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

import '../API/base_client.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  final usernameController = TextEditingController();

  final dobController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
  final medController = TextEditingController();
  final phoneController = TextEditingController();
  bool _obscureText = true;
  bool _obscureTextt = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    cPasswordController.dispose();
    usernameController.dispose();
    dobController.dispose();
    medController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/');
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.home),
        ),
        body: SizedBox(
          // color: Colors.amber[100],
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/signup_top.png",
                  width: 130,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  width: 80,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Signup'.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SvgPicture.asset(
                      'assets/icons/domain_names.svg',
                      width: 240,
                      height: 100,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: kPrimaryLightColor,
                      ),
                      child: TextField(
                        controller: emailController,
                        obscureText: false,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: "Your Email :",
                          hintStyle: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelText: "Email :",
                          labelStyle: TextStyle(
                            fontSize: 18,
                          ),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.person,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: kPrimaryLightColor,
                      ),
                      child: TextField(
                        controller: usernameController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: "Name :",
                          hintStyle: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelText: "Email :",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: kPrimaryLightColor,
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Password :",
                          hintStyle: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelText: "Email :",
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: kPrimaryLightColor,
                      ),
                      child: TextField(
                        controller: cPasswordController,
                        obscureText: _obscureTextt,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "Confirm Password :",
                          hintStyle: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelText: "Email :",
                          labelStyle: const TextStyle(
                            fontSize: 20,
                          ),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureTextt = !_obscureTextt;
                              });
                            },
                            child: Icon(_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: kPrimaryLightColor,
                      ),
                      child: TextField(
                        controller: dobController,
                        obscureText: false,
                        keyboardType: TextInputType.datetime,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: "Date of Birth :",
                          hintStyle: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelText: "Email :",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                        onTap: () => _selectDate(context),
                        readOnly: true,
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: kPrimaryLightColor,
                      ),
                      child: TextField(
                        controller: medController,
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: "Medical Condition :",
                          hintStyle: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelText: "Email :",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(66),
                        color: kPrimaryLightColor,
                      ),
                      child: TextField(
                        controller: phoneController,
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          hintText: "Phone Number :",
                          hintStyle: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          // labelText: "Email :",
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          // border: OutlineInputBorder(),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          createAccount();
                          // Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(15)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white60),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(66),
                            ),
                          ),
                        ),
                        child: Text(
                          'Signup'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Aleardy have an Account ? ",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'SourceSansPro',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: 'SourceSansPro',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //const OrDivider(),
                    //const Social(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (selectedDate != null && selectedDate != currentDate) {
      setState(() {
        dobController.text = _dateFormat.format(selectedDate);
      });
    }
  }

  void createAccount() async {
    // loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    // create new account

    if (password != cPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              // Icon(icon, color: Colors.white),
              SizedBox(width: 8.0),
              Text("Passwords aren't matching"),
            ],
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      try {
        FocusScope.of(context).unfocus();
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        if (userCredential.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: const [
                  // Icon(icon, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text("Successfully Created Account"),
                ],
              ),
              backgroundColor: Colors.green,
            ),
          );
          // add user details

          addUserDetails(
              usernameController.text.trim(),
              dobController.text.trim(),
              medController.text.trim(),
              emailController.text.trim(),
              int.parse(phoneController.text.trim()));
        }
      } on FirebaseAuthException catch (e) {
        print(e.code.toString());
        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email provided is invalid';
        } else if (e.code == 'operation-not-allowed') {
          errorMessage = 'Account creation is not allowed';
        } else {
          errorMessage = 'Error creating account';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                // Icon(icon, color: Colors.white),
                SizedBox(width: 8.0),
                Text(errorMessage),
              ],
            ),
            backgroundColor: Colors.red,
          ),
        );
      } on FirebaseException catch (e) {
        print("FIREBASE EXCEPTION");
        print("FIREBASE EXCEPTION");
        print("FIREBASE EXCEPTION");
      }
    }
    // remove circular progress
    Navigator.of(context).pop();
    Navigator.pop(context);
  }

  Future addUserDetails(
      String name, String dob, String med, String email, int phone) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;
    var body = {
      "fields": {
        "medical": {"stringValue": med},
        "phone": {"integerValue": phone},
        "uid": {"stringValue": uid},
        "uid": {"stringValue": uid},
        "dob": {"stringValue": dob},
        "email": {"stringValue": email},
        "username": {"stringValue": name}
      }
    };
    var response = await MyBaseClient().post('signup', "https://firestore.googleapis.com/v1/projects/physioplay-9e057/databases/(default)/documents/users/", body);

    if (response != null) {
      debugPrint("POST SUCCESS");
    } else {
      debugPrint("POST FAILED");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_auth_page/API/base_client.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth_page/constants.dart';
import 'package:flutter_auth_page/terms/authentication/terms_of_use.dart';

import '../API/users.dart';

// Define a stateless widget for the Welcome screen.
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;

            final double paddingValue =
                screenWidth * 0.1; // Adjust the padding percentage

            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_top.png",
                    width: screenWidth * 0.3,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/main_bottom.png",
                    width: screenWidth * 0.2,
                  ),
                ),

                //Padding(
                //padding: EdgeInsets.only(left: paddingValue),
                Center(
                  child: Column(
                    // alignment : Alignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.05),

                      Text(
                        'Physioplay'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          fontSize: screenWidth * 0.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.07),
                      SvgPicture.asset(
                        'assets/icons/gaming.svg',
                        width: screenWidth * 0.6,
                        height: screenHeight * 0.25,
                      ),

                      SizedBox(height: screenHeight * 0.1),
                      //width: screenWidth * 10,
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.1),
                          ),
                        ),
                        child: Text(
                          'Login'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyanAccent,
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.1),
                          ),
                        ),
                        child: Text(
                          'Signup'.toUpperCase(),
                          style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      TermsOfUse(),
                    ],
                  ),
                ),
                //  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

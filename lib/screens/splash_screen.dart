import 'dart:async';

import 'package:blog_app_flutter/screens/home_screen.dart';
import 'package:blog_app_flutter/screens/option_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final user = firebaseAuth.currentUser;

    if (user != null) {

      Timer(Duration(seconds: 3),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))
      );

    } else {
      Timer(Duration(seconds: 3),
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => OptionScreen()))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/firebase_logo.png',
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width * .6,
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Firebase Blog App',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          )
        ],
      ),
    );
  }
}

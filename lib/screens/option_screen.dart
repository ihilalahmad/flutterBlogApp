import 'package:flutter/material.dart';
import 'package:blog_app_flutter/components/round_button.dart';
import 'package:blog_app_flutter/screens/register_screen.dart';
import 'package:blog_app_flutter/screens/sign_in_screen.dart';


class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/firebase_logo.png',
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Firebase Blog App',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                btnName: 'Login',
                btnOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                btnName: 'Register',
                btnOnPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

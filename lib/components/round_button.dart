import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String btnName;
  final VoidCallback btnOnPressed;

  RoundButton({required this.btnName, required this.btnOnPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        color: Colors.green,
        height: 50,
        minWidth: double.infinity,
        child: Text(
          btnName,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: btnOnPressed,
      ),
    );
  }
}

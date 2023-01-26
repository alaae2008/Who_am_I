// ignore_for_file: prefer_const_declarations, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pr1/butons.dart';

class LogoPage extends StatelessWidget {
  static final id = 'logoPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo image
              Image.asset(
                'assets/images/logo.png',
                width: 400,
                height: 400,
              ),
              // Start button
              customStartButton(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

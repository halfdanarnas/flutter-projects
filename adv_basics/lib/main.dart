import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        body:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 219, 215, 224),
                Color.fromARGB(255, 130, 57, 255),
              ],
              begin:Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            ),
          child: const StartScreen(),
          ),
      ),
    ),
  );
}

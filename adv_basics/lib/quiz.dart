import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/start_screen.dart';
import 'package:flutter/widgets.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
var activeScreen = 'start-screen';


  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    return
    MaterialApp(
      home: Scaffold(
        body:  Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 46, 4, 96),
                Color.fromARGB(255, 130, 57, 255),
              ],
              begin:Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            ),
          child: activeScreen == 'start-screen' 
          ? StartScreen(switchScreen) 
          : const QuestionsScreen(),
          ),
      ),
    );
  }
}
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/models/results_screen.dart';
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
 List<String> selectedAnswers = [];
var activeScreen = 'result-screen';

 void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

void chooseAnswer(String answer) {
  selectedAnswers.add(answer);

  if (selectedAnswers.length == questions.length) {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'result-screen';
    });
  }
}
  @override
  Widget build(context) {
    Widget screenWidget =  StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer ,
        );
    }    

    if (activeScreen == 'result-screen') {
      screenWidget =  ResultsScreen(
        chosenAnswers: selectedAnswers,
        );
    }  
        
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
          child: screenWidget,
          ),
      ),
    );
  }
}
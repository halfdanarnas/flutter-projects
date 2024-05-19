import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
       decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: isCorrectAnswer
            ? [const Color.fromARGB(255, 0, 111, 4), const Color.fromARGB(255, 0, 111, 4)]
            : [const Color.fromARGB(255, 255, 17, 0), const Color.fromARGB(255, 255, 17, 0)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: Border.all(
        color: Colors.black,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(100),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0),
          spreadRadius: 1,
          blurRadius: 3,
          offset: const Offset(-1, -1),
        ),
        BoxShadow(
          color: Colors.grey.withOpacity(0),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(3, 3),
        ),
      ],
    ),
    child: Text(
      questionNumber.toString(),
      style: GoogleFonts.abrilFatface(
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
  );
}}
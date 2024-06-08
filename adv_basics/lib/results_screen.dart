import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    final bool allCorrect = numCorrectQuestions == numTotalQuestions;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 195, 6, 6),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (allCorrect)
                      Column(
                        children: [
                          Text(
                            'Til hamingju þú svaraðir öllum spurningum rétt!',
                            style: GoogleFonts.abrilFatface(
                              color: Color.fromARGB(255, 73, 129, 73),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/images/ronburgundy.png', // Replace with your image asset path
                            height: 150, // Adjust the height of the image
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          Text(
                            'Þú svaraðir $numCorrectQuestions af $numTotalQuestions spurningum rétt!',
                            style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/images/ron2.png', // Replace with your image asset path
                            height: 150, // Adjust the height of the image
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    QuestionsSummary(summaryData),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton.icon(
                      onPressed: onRestart,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Gerðu aftur!'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

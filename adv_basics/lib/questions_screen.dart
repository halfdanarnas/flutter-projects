import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:audioplayers/audioplayers.dart';
// import 'package:audioplayers_web/audioplayers_web.dart';





class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  late AudioPlayer _audioPlayer;


  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    // Use a post frame callback to play audio after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _playAudio(questions[currentQuestionIndex].audioFilePath);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });

    // Play audio for the next question if available
    if (currentQuestionIndex < questions.length) {
      _playAudio(questions[currentQuestionIndex].audioFilePath);
    }
  }

Future<void> _playAudio(String? filePath) async {
  if (filePath == null) return;
  try {
    await _audioPlayer.play(AssetSource('audio/$filePath')); 
  } catch (e) {
    print('Error playing audio: $e');
  }
}




  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
  return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (currentQuestionIndex == 2 || currentQuestionIndex == 4) ...[
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text( 
                          currentQuestionIndex == 2
                              ? 'Star Wars lagið inniheldur hreina 5und. Það er gott að heyra tónbil á lögum sem maður þekkir vel'
                              : 'Jaws lagið inniheldur litla 2und',
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Fara til baka'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Fróðleiksmoli'), // Change button text here
              ),
              const SizedBox(height: 30),
            ],
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
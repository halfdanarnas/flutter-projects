import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:audioplayers/audioplayers.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    Key? key,
    required this.onSelectAnswer,
  }) : super(key: key);

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late AudioPlayer _audioPlayer;
  var currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
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

  void _showStarWarsOrJawsDialog(int currentQuestionIndex) {
    String audioFileName;
    String dialogText;
    String imagePath;

    if (currentQuestionIndex == 2) {
      audioFileName = 'StarWars.mp3'; // Set Star Wars audio file name
      dialogText = 'Star Wars lagið inniheldur hreina 5und. Það er gott að heyra tónbil á lögum sem maður þekkir vel';
      imagePath = 'assets/images/Star_Wars_Logo.svg.png'; // Set Star Wars image path
    } else if (currentQuestionIndex == 4) {
      audioFileName = 'Jaws.mp3'; // Set Jaws audio file name
      dialogText = 'Jaws lagið inniheldur litla 2und';
      imagePath = 'assets/images/jaws.png'; // Set Jaws image path
    } else {
      return; // Add conditions for other questions if needed
    }

    _playAudio(audioFileName); // Play corresponding audio

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Stack(
            children: [
              Image.asset(
                imagePath,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.8),
                  child: Text(
                    dialogText,
                    style: GoogleFonts.abrilFatface(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.black, Colors.blue],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _showStarWarsOrJawsDialog(currentQuestionIndex);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.transparent,
                    backgroundColor: Color.fromARGB(0, 7, 15, 117),
                    shadowColor: Colors.transparent,
                    minimumSize: const Size(0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 25,
                    ),
                    child: Text(
                      'Fróðleiksmoli',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18, // Change font size here
                        fontWeight: FontWeight.bold, // Add font weight here
                      ),
                    ),
                  ),
                ),
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

import 'package:adv_basics/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    ['stækkuð 4und', 'hrein 4und', 'lítil 3und', 'stór 2und'],
    audioFilePath: 'test-sound.mp3',
  ),
  QuizQuestion('Hvaða tónbil er þetta?', [
    'stór 6und',
    'hrein 5und',
    'stór 7und',
    'lítil 6und',
  ], audioFilePath: 'test-sound2.mp3'),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'hrein 5und',
      'lítil 2und',
      'stækkuð 4und',
      'lítil 3und',
    ], audioFilePath: 'test-sound3.mp3'),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'lítil 7und',
      'stór 3und',
      'stór 2und',
      'hrein 8und',
    ], audioFilePath: 'test-sound4.mp3'
  ),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'lítil 6und',
      'lítil 2und',
      'hrein 4und',
      'stór 7und',
    ], audioFilePath: 'test-sound5.mp3'
  ),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'hrein 5und',
      'stór 2und',
      'lítil 2und',
      'lítil 7und',
    ], audioFilePath: 'test-sound6.mp3'
  ),
];
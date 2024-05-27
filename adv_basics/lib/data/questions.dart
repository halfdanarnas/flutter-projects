import 'package:adv_basics/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    ['Perfect fifth', 'Perfect fourth', 'Minor second', 'Major second'],
    audioFilePath: 'test-sound.mp3',
  ),
  QuizQuestion('Hvaða tónbil er þetta?', [
    'hrein 8und',
    'hrein 5und',
    'stór 6und',
    'lítil 6und',
  ], audioFilePath: 'test-sound2.mp3'),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'lítil 3und',
      'lítil 2und',
      'stækkuð 4und/minnkuð 5und(tónskratti)',
      'lítil 7und',
    ],
  ),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'hrein 8und',
      'stór 3und',
      'stór 2und',
      'stór 6und',
    ],
  ),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'hrein 5und',
      'stór 6und',
      'hrein 4und',
      'stór 7und',
    ],
  ),
  QuizQuestion(
    'Hvaða tónbil er þetta?',
    [
      'stækkuð 4und/minnkuð 5und(tónskratti)',
      'stór 2und',
      'lítil 2und',
      'lítil 7und',
    ],
  ),
];
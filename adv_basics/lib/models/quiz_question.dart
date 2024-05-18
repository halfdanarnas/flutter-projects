class QuizQuestion {
  const QuizQuestion(this.text, this.answers,{this.audioFilePath});

  final String text;
  final List<String> answers;
  final String? audioFilePath;

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
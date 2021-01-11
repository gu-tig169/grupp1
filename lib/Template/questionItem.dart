class QuestionItem {
  final String category;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswer;

  List<AnswerOption> answerOptions = [];

  QuestionItem(
      {this.category,
      this.question,
      this.difficulty,
      this.correctAnswer,
      this.incorrectAnswer});

//Mappar om json och returnerar QuestionItem.
  factory QuestionItem.fromJson(Map<String, dynamic> json) {
    return QuestionItem(
      category: json['category'],
      question: json['question'],
      difficulty: json['difficulty'],
      correctAnswer: json['correct_answer'],
      incorrectAnswer: json['incorrect_answers'].cast<String>(),
    );
  }

//Gör om alla frågor till answerOption, lägger till dem i listan answerOptions och blandar listan.
  void createAnswerOptions() {
    //skapar ett answerOption för varje instans i listan incorrectAnswer och lägger till i answerOptions
    for (var answer in incorrectAnswer) {
      answerOptions.add(AnswerOption(answer, false));
    }
    //skapar ett answerOption av correctAnswer och lägger till i answerOptions
    answerOptions.add(AnswerOption(correctAnswer, true));
    answerOptions.shuffle();
  }
}

class AnswerOption {
  final String answer;
  final bool isCorrect;

  AnswerOption(this.answer, this.isCorrect);
}

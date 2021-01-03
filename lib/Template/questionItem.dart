import 'package:Quiz/Template/answerOption.dart';

class QuestionItem {
  String category;
  String question;
  String correctAnswer;
  List<String> incorrectAnswer;
  List<AnswerOption> _answerOptions = [];
  bool point;

  QuestionItem(
      {this.category,
      this.question,
      this.correctAnswer,
      this.incorrectAnswer,
      this.point = false});

  List<AnswerOption> get answerOptions => _answerOptions;

  factory QuestionItem.fromJson(Map<String, dynamic> json) {
    return QuestionItem(
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswer: json['incorrect_answers'].cast<String>(),
    );
  } //fromJson

  void createAnswerOptions() {
    //skapar ett answerOption för varje instans i listan incorrectAnswer och lägger till i answerOptions
    for (var answer in incorrectAnswer) {
      _answerOptions.add(AnswerOption(answer, false));
    }
    //skapar ett answerOption av correctAnswer och lägger till i answerOptions
    _answerOptions.add(AnswerOption(correctAnswer, true));
    _answerOptions.shuffle();
  } //createAnswerOptions
} // class QuestionItem

class QuestionItem {
  String category;
  String question;
  String correctAnswer;
  List<String> incorrectAnswer;
  bool point;

  QuestionItem(
      {this.category,
      this.question,
      this.correctAnswer,
      this.incorrectAnswer,
      this.point = false});

  factory QuestionItem.fromJson(Map<String, dynamic> json) {
    return QuestionItem(
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswer: json['incorrect_answers'].cast<String>(),
    );
  }
} // class QuestionItem

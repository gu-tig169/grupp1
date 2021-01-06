import './questionItem.dart';

class QuizList {
  List<QuestionItem> _questions;
  int questionItemIndex = 0;

  QuizList(this._questions);

  List<QuestionItem> get questions => _questions;

  //Går igenom listan med frågor
  QuestionItem getNextQuestion() {
    if (questionItemIndex == questions.length) {
      return null;
    } else {
      var currentQuestion = questions.elementAt(questionItemIndex);
      questionItemIndex++;
      print('Nuvarande index: $questionItemIndex');
      return currentQuestion;
    }
  }
} //class QuizList

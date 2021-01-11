import './questionItem.dart';

class QuizList {
  final List<QuestionItem> questions;
  int questionItemIndex = 0;

  QuizList(this.questions);

  //Går igenom listan med frågor
  QuestionItem getNextQuestion() {
    if (questionItemIndex == questions.length) {
      return null;
    } else {
      var currentQuestion = questions.elementAt(questionItemIndex);
      questionItemIndex++;
      print('Question $questionItemIndex');
      return currentQuestion;
    }
  }
} //class QuizList

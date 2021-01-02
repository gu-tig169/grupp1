import './questionItem.dart';

class QuizList {
  List<QuestionItem> questions;
  int questionItemIndex = 0;

  QuizList(this.questions);

  List<QuestionItem> get allquestions => questions;
}

// function getNextQuestion() {
// Check att det finns frågor att returnera
// ta frågan på plats questionItemIndex
// Stega upp questionItemIndex med 1
// returnera frågan
//}

import 'package:flutter/material.dart';

import './questionItem.dart';

class QuizList {
  List<QuestionItem> questions;
  int questionItemIndex = 0;

  QuizList(this.questions);

  List<QuestionItem> get allquestions => questions;

  //goes through the list of questions.
  QuestionItem getNextQuestion() {
    if (questionItemIndex == questions.length) {
      print(
          'End of list'); //gör om till funktion som behandlar sista frågan i quizList
    } else {
      var currentQuestion = questions.elementAt(questionItemIndex);
      print('Vårt nuvarande index: $questionItemIndex');
      questionItemIndex++;
      print('Vårt nya index: $questionItemIndex');
      return currentQuestion;
    }
  }
} //class QuizList

import 'package:flutter/material.dart';

import './questionItem.dart';

class QuizList {
  List<QuestionItem> questions;
  int questionItemIndex = 0;

  QuizList(this.questions);

  List<QuestionItem> get allquestions => questions;

  QuestionItem getNextQuestion() {
    if (questions.isEmpty) {
      print('Error, no questions found!');
    } else {
      var currentQuestion = questions.elementAt(questionItemIndex);
      print('Vårt nuvarande index: $questionItemIndex');
      questionItemIndex++;
      print('Vårt nya index: $questionItemIndex');
      return currentQuestion;
    }
  }
} //class QuizList

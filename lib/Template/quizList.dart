import 'package:flutter/material.dart';

import './questionItem.dart';

class QuizList {
  List<QuestionItem> questions;
  int questionItemIndex;
  var choosedCategory;
  var choosedDifficulty;

  QuizList(this.questions, this.questionItemIndex);
}

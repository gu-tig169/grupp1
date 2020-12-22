import 'package:flutter/material.dart';

import './questionItem.dart';

class QuizList {
  final List<QuestionItem> questions;
  final int questionItemIndex;

  QuizList(this.questions, this.questionItemIndex);
}

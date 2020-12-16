import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  final QuestionItem testQuestion = QuestionItem('Grupp 1',
      'Vem i grupp 1 har två katter?', 'Emelie', ['Ellinor', 'Erika', 'Alex']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizView'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(testQuestion.category), //ersätt med ('$category')
            _image(),
            Text(testQuestion.question),
            GridView.count(
                crossAxisCount: 2,
                children: List.generate(4, (index) {
                  return Center(child: Card(child: Text('')));
                }))
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Center(child: Image(image: AssetImage('assets/logo.png')));
  }
}

class QuestionItem {
  final String category;
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswer;

  QuestionItem(
      this.category, this.question, this.correctAnswer, this.incorrectAnswer);
}

//class Answer

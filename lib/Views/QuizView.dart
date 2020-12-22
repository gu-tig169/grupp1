import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';

class QuizView extends StatelessWidget {
  final QuestionItem testQuestion = QuestionItem(
    'Category',
    'Vem i grupp 1 har två katter?',
    'Emelie',
    ['Ellinor', 'Erika', 'Alex'],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                _image(),
                Text(
                  testQuestion.category,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: AppTheme.smallFontSize),
                ),
              ],
            ),
            Container(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Container(
                height: 50,
                width: 330,
                child: Center(
                  child: Text(
                    testQuestion.question,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: AppTheme.smallFontSize),
                  ),
                ),
              ),
            ),
            _answerCards(context),
            Container(height: 50),
            _linearProgressIndicator()
          ], //Column children
        ),
      ),
    );
  }

  Widget _image() {
    return Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        height: 80,
        width: 80,
      ),
    );
  }

  Widget _answerCards(context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_card(context), _card(context)]),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_card(context), _card(context)]),
      ],
    );
  }

  Widget _card(context) {
    return Card(
      child: InkWell(
        //splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: Container(
          height: 130,
          width: 160,
          child: Center(
            child: Text(
              'Answer',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontSize: AppTheme.smallFontSize),
            ),
          ),
        ),
      ),
    );
  }

  Widget _linearProgressIndicator() {
    return SizedBox(
      width: 330,
      child: LinearProgressIndicator(
        minHeight: 15,
        backgroundColor: Colors.green[900],
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepPurple),
      ),
    );
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

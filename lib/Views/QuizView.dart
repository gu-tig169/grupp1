import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/Template/quizList.dart';
import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';

class QuizView extends StatefulWidget {
  final QuizList quizList;

  QuizView({this.quizList});

  @override
  State<StatefulWidget> createState() => QuizViewState(quizList);
}

class QuizViewState extends State<QuizView> {
  QuestionItem currentQuestion;
  QuizList quizList;

  QuizViewState(QuizList quizList) {
    this.quizList = quizList;
  }

  Widget build(BuildContext context) {
    currentQuestion = quizList.getNextQuestion();

    return Scaffold(
      //Tillfällig kod
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF1B5E20),
        ),
      ),
      //End

      body: Center(
        child: Column(
          children: [
            Row(children: [_logo(), _categoryField()]),
            Container(height: 10),
            _questionField(),
            _answerCards(context),
            Container(height: 50),
            //_linearProgressIndicator()
          ], //Column children
        ),
      ),
    );
  }

  Widget _logo() {
    return Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        height: 80,
        width: 80,
      ),
    );
  }

  Widget _categoryField() {
    return Text(currentQuestion.category,
        style: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(fontSize: AppTheme.smallFontSize));
  }

  Widget _questionField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        height: 50,
        width: 330,
        child: Center(
          child: Text(
            currentQuestion.question,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontSize: AppTheme.smallFontSize),
          ),
        ),
      ),
    );
  }

  Widget _answerCards(context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _card(context,
              ('${currentQuestion.answerOptions.elementAt(0).answer}')),
          _card(
              context, ('${currentQuestion.answerOptions.elementAt(1).answer}'))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _card(context,
              ('${currentQuestion.answerOptions.elementAt(2).answer}')),
          _card(
              context, ('${currentQuestion.answerOptions.elementAt(3).answer}'))
        ]),
      ],
    );
  }

  Widget _card(context, text) {
    return Card(
      child: InkWell(
        //splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          print('du klickade på ett kort');
        },
        child: Container(
          height: 130,
          width: 160,
          child: Center(
            child: Text(
              '$text',
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
} //class QuizView

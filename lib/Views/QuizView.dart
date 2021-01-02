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
  //QuestionItem question;
  QuizList quizList;

  //QuizViewState(this.quizList);

  QuizViewState(QuizList quizList) {
    this.quizList = quizList;
    print('det här är QuizViewState: $quizList');
    print(
        'Här vill vi se answerOptions: ${quizList.allquestions.elementAt(0).answerOptions}');
  }

  Widget build(BuildContext context) {
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
    return Text('${quizList.allquestions.elementAt(0).category}',
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
            '${quizList.allquestions.elementAt(0).question}',
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
        onTap: () {
          print('knappen går att klicka');
          print('$quizList');
          //print('${quizList.elementAt(2).question}');
        },
        child: Container(
          height: 130,
          width: 160,
          child: Center(
            child: Text(
              '${quizList.allquestions.elementAt(0).correctAnswer}',
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

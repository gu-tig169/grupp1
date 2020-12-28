import 'package:Quiz/Template/questionItem.dart';
import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';

class QuizView extends StatefulWidget {
  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final QuestionItem testQuestion = QuestionItem(
    'Category',
    'Vem i grupp 1 har två katter?',
    'Emelie',
    ['Ellinor', 'Erika', 'Alex'],
  );

  @override
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
            Row(
              children: [
                _logo(),
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

  Widget _logo() {
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

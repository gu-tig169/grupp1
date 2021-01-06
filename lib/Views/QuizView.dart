import 'package:Quiz/Navigation/NavigationBar.dart';
import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/Template/quizList.dart';
import 'package:Quiz/Template/result.dart';
import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';

class QuizView extends StatefulWidget {
  final QuizList quizList;

  QuizView({this.quizList});

  @override
  State<StatefulWidget> createState() => QuizViewState(quizList);
}

class QuizViewState extends State<QuizView> {
  QuizList quizList;
  QuestionItem currentQuestion;
  bool _selected = false;
  int _score = 0;
  String _category;
  //String difficulty

  QuizViewState(QuizList quizList) {
    this.quizList = quizList;
  }

  Widget build(BuildContext context) {
    if (quizList.questionItemIndex == 0) {
      currentQuestion = quizList.getNextQuestion();
      _category = currentQuestion.category;
    }

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
            _answerCardsGrid(context),
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

  Widget _answerCardsGrid(context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _card(context, currentQuestion.answerOptions.elementAt(0)),
          _card(context, currentQuestion.answerOptions.elementAt(1))
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _card(context, currentQuestion.answerOptions.elementAt(2)),
          _card(context, currentQuestion.answerOptions.elementAt(3))
        ]),
      ],
    );
  }

//Korten byter BorderColor för att visa om frågan är rätt/fel, beror av _selected.
//onTap sätter _selected & kollar om svaret är rätt/fel och ändrar point & ropar på nästa fråga
  Widget _card(context, _answerOption) {
    return Card(
      shape: _selected
          ? _answerOption.isCorrect
              ? new RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0))
              : new RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0))
          : new RoundedRectangleBorder(
              side: new BorderSide(color: AppTheme.primaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        splashColor: Colors.black.withAlpha(30),
        onTap: () async {
          _selected = true;
          setState(() {});
          await Future.delayed(Duration(seconds: 1));
          if (_answerOption.isCorrect) {
            currentQuestion.point = true;
            _score++;
          }
          currentQuestion = quizList.getNextQuestion();
          if (currentQuestion == null) {
            var result = Result(_category, _score);
            print('Slut på frågor. Dina poäng: ${result.score}/10');
            await _showResult(context, result);
          }
          _selected = false;
          setState(() {});
        },
        child: Container(
          height: 130,
          width: 160,
          child: Center(
            child: Text(
              '${_answerOption.answer}',
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

  Future _showResult(context, result) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              decoration: BoxDecoration(color: Color(0xFF4C8C4A)),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Finished!\n ${result.score}/10',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontSize: AppTheme.normalFontSize),
                    ),
                    Container(height: 30),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomNavBar()));
                        },
                        child: Text(
                          "Continue",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
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

import 'package:Quiz/API/resultApi.dart';
import 'package:Quiz/Navigation/NavigationBar.dart';
import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/Template/quizList.dart';
import 'package:Quiz/Template/result.dart';
import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:confetti/confetti.dart';

class QuizView extends StatefulWidget {
  final QuizList quizList;

  QuizView({this.quizList});

  @override
  State<StatefulWidget> createState() => QuizViewState(quizList);
}

class QuizViewState extends State<QuizView>
    with SingleTickerProviderStateMixin {
  ConfettiController _controller;
  QuizList quizList;
  QuestionItem currentQuestion;
  String _category;
  String _difficulty;
  int _score = 0;
  bool _selected = false;

  QuizViewState(QuizList quizList) {
    this.quizList = quizList;
  }

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: Duration(seconds: 2),
    );
  }

  Widget build(BuildContext context) {
    if (quizList.questionItemIndex == 0) {
      currentQuestion = quizList.getNextQuestion();
      _category = currentQuestion.category;
      _difficulty = currentQuestion.difficulty;
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
            _answerCardsField(context),
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

  Widget _answerCardsField(context) {
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
//onTap sätter _selected & kollar om svaret är rätt/fel -> ändrar point & ropar på nästa fråga
  Widget _card(context, _answerOption) {
    return Card(
      shape: _selected
          ? _answerOption.isCorrect
              ? RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0))
              : RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.circular(4.0))
          : RoundedRectangleBorder(
              side: BorderSide(color: AppTheme.primaryColor, width: 2.0),
              borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        onTap: () async {
          _selected = true;
          setState(() {});
          await Future.delayed(Duration(seconds: 1));
          _countScore(_answerOption);
          currentQuestion = quizList.getNextQuestion();
          if (currentQuestion == null) {
            var result = Result(_category, _difficulty);
            result.score = _score;
            ResultApi.addResult(result);
            print('Slut på frågor. Dina poäng: ${result.score}/10');
            _controller.play();
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

  void _countScore(_answerOption) {
    if (_answerOption.isCorrect) {
      currentQuestion.point = true;
      if (_difficulty == 'hard') {
        _score += 3;
      }
      if (_difficulty == 'medium') {
        _score += 2;
      }
      if (_difficulty == 'easy') {
        _score++;
      }
    }
  }

  Future _showResult(context, result) async {
    String totalPoints;
    if (_difficulty == 'hard') {
      totalPoints = '30';
    }
    if (_difficulty == 'medium') {
      totalPoints = '20';
    }
    if (_difficulty == 'easy') {
      totalPoints = '10';
    }

    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(children: [
            Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF4C8C4A),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(height: 25),
                      Text(
                        'Finished!\n ${result.score}/$totalPoints',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(fontSize: AppTheme.normalFontSize),
                      ),
                      Container(height: 10),
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
            ),
            _confetti(),
          ]);
        });
  }

  Widget _confetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        blastDirectionality: BlastDirectionality.explosive,
        confettiController: _controller,
        particleDrag: 0.1,
        emissionFrequency: 0.05,
        numberOfParticles: 15,
        gravity: 0.05,
        colors: [
          Colors.green,
          Colors.purple,
          Colors.lightGreen,
          Colors.amber,
        ],
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

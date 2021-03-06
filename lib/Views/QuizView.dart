import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/Misc/logo.dart';
import 'package:Quiz/model.dart';
import 'package:Quiz/Navigation/NavigationBar.dart';
import 'package:Quiz/Template/result.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/Template/quizList.dart';

class QuizView extends StatefulWidget {
  final QuizList quizList;

  QuizView({this.quizList});

  @override
  State<StatefulWidget> createState() => QuizViewState(quizList);
}

class QuizViewState extends State<QuizView>
    with SingleTickerProviderStateMixin {
  QuizList quizList;
  QuestionItem currentQuestion;

  String _category;
  String _difficulty;
  int _score = 0;

  bool _selected = false;
  bool enabled = true;

  Timer _timer;
  int counter;
  ConfettiController _controller;

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
      _startTimer();
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(height: 30),
            Row(children: [smallLogo(), _categoryField()]),
            _questionField(),
            _answerCardsField(context),
            Container(height: 30),
            Text('$counter',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 50.0))
          ], //Column children
        ),
      ),
    );
  }

  Widget _categoryField() {
    return Text(currentQuestion.category,
        style: Theme.of(context)
            .textTheme
            .headline4
            .copyWith(fontSize: AppTheme.normalHeaderFontSize));
  }

  Widget _questionField() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: Container(
        height: 100,
        width: 330,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
                '${quizList.questionItemIndex}. ${currentQuestion.question}',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: AppTheme.normalFontSize)),
          ),
        ),
      ),
    );
  }

  Widget _answerCardsField(context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _card(context, currentQuestion.answerOptions.elementAt(0)),
        _card(context, currentQuestion.answerOptions.elementAt(1))
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        _card(context, currentQuestion.answerOptions.elementAt(2)),
        _card(context, currentQuestion.answerOptions.elementAt(3))
      ]),
    ]);
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
      child: AbsorbPointer(
        absorbing: !enabled,
        child: InkWell(
          onTap: () async {
            setState(() {
              _selected = true;
              enabled = false;
            });
            _timer.cancel();
            _countScore(_answerOption);
            await Future.delayed(Duration(seconds: 2));
            var value = quizList.getNextQuestion();
            if (value == null) {
              _endOfQuiz();
            } else {
              setState(() {
                currentQuestion = value;
                _selected = false;
                enabled = true;
                _startTimer();
              });
            }
          },
          child: Container(
            height: 130,
            width: 160,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text('${_answerOption.answer}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: AppTheme.smallFontSize)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    counter = 12;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      if (counter >= 1) {
        setState(() {
          counter--;
        });
      }
      if (counter < 1) {
        _timer.cancel();
        var value = quizList.getNextQuestion();
        if (value == null) {
          _endOfQuiz();
        } else {
          setState(() {
            currentQuestion = value;
            _startTimer();
          });
        }
      }
    });
  }

//räknar ut score beroende på svårighetsgrad
  void _countScore(answerOption) {
    if (answerOption.isCorrect) {
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

//Sparar upp resultatet till api:et och ropar på dialogrutan.
  Future _endOfQuiz() async {
    print('End of Quiz');
    var result =
        Result(category: _category, difficulty: _difficulty, score: _score);
    result.countPossibleScore(quizList.questions.length);
    Provider.of<AppState>(context, listen: false).addResult(result);
    _controller.play();
    await _showResult(context, result);
  }

//Bygger dialogrutan som visar att quizet är slut och användarens resultat.
  Future _showResult(context, result) async {
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
                    borderRadius: BorderRadius.circular(10.0)),
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(height: 25),
                      Text('Finished!\n $_score/${result.possibleScore} points',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: AppTheme.normalFontSize)),
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
                          child: Text("Continue",
                              style: Theme.of(context).textTheme.subtitle1),
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
          AppTheme.primaryTextColor,
          AppTheme.buttonColor,
          AppTheme.primaryColor,
          AppTheme.iconColor
        ],
      ),
    );
  }
} //class QuizView

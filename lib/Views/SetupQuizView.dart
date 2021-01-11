import 'package:flutter/material.dart';

import 'package:Quiz/Api/triviaApi.dart';
import 'package:Quiz/Misc/logo.dart';
import 'package:Quiz/Template/categories.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/Template/quizList.dart';
import 'package:Quiz/Views/QuizView.dart';

class SetupQuizView extends StatefulWidget {
  @override
  _SetupQuizViewState createState() => _SetupQuizViewState();
}

class _SetupQuizViewState extends State<SetupQuizView> {
  final List<CategoryItem> categories = getCategories();
  final List<String> difficulties = ['easy', 'medium', 'hard'];

  String choosedCategory;
  String choosedDifficulty = 'easy';
  List<QuestionItem> _quizList = [];

  List<QuestionItem> get quizList => _quizList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(elevation: 0.0, backgroundColor: Color(0xFF1B5E20))),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            bigLogo(),
            _headerDifficulty(),
            _dropdownMenu(),
            Container(height: 15),
            _headerCategory(),
            _categoryList()
          ]),
        ),
      ),
    );
  }

  _headerDifficulty() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text('Choose Difficulty',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: AppTheme.normalFontSize)),
    );
  }

  Widget _dropdownMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        value: choosedDifficulty,
        icon: Icon(Icons.arrow_downward, color: AppTheme.primaryTextColor),
        onChanged: (String difficulty) {
          setState(() {
            choosedDifficulty = difficulty;
          });
        },
        items: difficulties.map((String difficulty) {
          return DropdownMenuItem<String>(
            value: difficulty,
            child: Row(children: [
              SizedBox(width: 30),
              Text(difficulty,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: AppTheme.normalFontSize)),
            ]),
          );
        }).toList(),
      ),
    );
  }

  Widget _headerCategory() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      child: Text('Choose Category',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: AppTheme.normalFontSize)),
    );
  }

  Widget _categoryList() {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) =>
            _categoryListItem(context, index),
      ),
    );
  }

  Widget _categoryListItem(BuildContext context, int index) {
    final categoryListItem = categories[index];

    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        child: ListTile(
            leading: Icon(categoryListItem.icon, color: AppTheme.iconColor),
            title: Text(categoryListItem.categoryName,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: AppTheme.normalFontSize))),
        onTap: () async {
          choosedCategory = categoryListItem.urlNumber;
          await _buildQuizList();
          print('Hittar instans av quizList: ${_quizList.isNotEmpty}');
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QuizView(quizList: QuizList(_quizList))));
        },
      ),
    );
  }

//Hämtar frågorna från TriviaApi.
  Future _buildQuizList() async {
    _quizList = await TriviaApi.getQuiz(choosedCategory, choosedDifficulty);
    for (QuestionItem questionItem in _quizList) {
      questionItem.createAnswerOptions();
    }
    return _quizList;
  }
}

import 'package:Quiz/Template/answerOption.dart';
import 'package:Quiz/Template/categories.dart';
import 'package:Quiz/Template/logo.dart';
import 'package:Quiz/Template/quizList.dart';
import 'package:flutter/material.dart';

import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/Api/triviaApi.dart';
import 'QuizView.dart';

class SetupQuizView extends StatefulWidget {
  @override
  _SetupQuizViewState createState() => _SetupQuizViewState();
}

class _SetupQuizViewState extends State<SetupQuizView> {
  String choosedDifficulty;
  String choosedCategory;

  List<QuestionItem> _quizList = [];
  List<String> difficulties = ['easy', 'medium', 'hard'];
  List<CategoryItem> categories = getCategories();

  List<QuestionItem> get quizList => _quizList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Color(0xFF1B5E20),
          )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bigLogo(),
              _headerDifficulty(),
              _dropdownMenu(),
              Container(height: 15),
              _headerCategory(),
              _categoryList(),
            ],
          ),
        ),
      ),
    );
  }

  _headerDifficulty() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        'Choose Difficulty',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.normalFontSize),
      ),
    );
  }

  Widget _dropdownMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        hint: Text(
          'Difficulty',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: AppTheme.normalFontSize),
        ),
        value: choosedDifficulty,
        icon: Icon(Icons.arrow_downward, color: AppTheme.primaryTextColor),
        onChanged: (String value) {
          setState(() {
            choosedDifficulty = value;
          });
        },
        items: difficulties.map((String difficulty) {
          return DropdownMenuItem<String>(
            value: difficulty,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  difficulty,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: AppTheme.normalFontSize),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _headerCategory() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 5),
      child: Text(
        'Choose Category',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: AppTheme.normalFontSize),
      ),
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
    final categoryList = categories[index];

    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () async {
          choosedCategory = categoryList.urlNumber;
          await _buildQuizList();
          print('Hittar instans av quizList: ${_quizList.isNotEmpty}');
          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QuizView(quizList: QuizList(_quizList))));
        },
        child: ListTile(
          leading: Icon(categoryList.icon, color: AppTheme.iconColor),
          title: Text(
            categoryList.categoryName,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontSize: AppTheme.normalFontSize),
          ),
        ),
      ),
    );
  }

//Hämtar frågorna från TriviaApi & formaterar, samt bygger quizList.
  Future _buildQuizList() async {
    if (choosedDifficulty == null) {
      choosedDifficulty = 'easy';
    }
    _quizList = await TriviaApi.getQuiz(choosedCategory, choosedDifficulty);
    for (QuestionItem item in _quizList) {
      item.category = item.category.replaceAll('Entertainment:', '');
      item.category = item.category.replaceAll('Science:', '');
      item.category = item.category.replaceAll('General Knowledge', 'Random');
      item.category = item.category.replaceAll('&rsquo;', '\'');

      item.question = item.question.replaceAll('&quot;', '”');
      item.question = item.question.replaceAll('&#039;', '\'');

      item.createAnswerOptions();

      for (AnswerOption value in item.answerOptions) {
        value.answer = value.answer.replaceAll('&quot;', '”');
        value.answer = value.answer.replaceAll('&#039;', '\'');
        value.answer = value.answer.replaceAll('&anp;', '&');
      }
    }
    return _quizList;
  }
}

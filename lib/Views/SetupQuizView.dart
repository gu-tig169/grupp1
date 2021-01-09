import 'package:Quiz/Template/answerOption.dart';
import 'package:Quiz/Template/categoriesAndDifficulties.dart';
import 'package:Quiz/Template/quizList.dart';
import 'package:flutter/material.dart';

import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/questionItem.dart';
import 'package:Quiz/API/triviaApi.dart';
import 'QuizView.dart';

class SetupQuizView extends StatefulWidget {
  @override
  _SetupQuizViewState createState() => _SetupQuizViewState();
}

class _SetupQuizViewState extends State<SetupQuizView> {
  DifficultyItem choosedDifficulty;
  String choosedCategory;

  List<QuestionItem> _quizList = [];
  List<DifficultyItem> difficulties = getDifficulties();
  List<CategoryItem> categories = getCategories();

  List<QuestionItem> get quizList => _quizList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ta bort appbar i slutet
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF1B5E20),
        ),
      ),
      //ta bort ner hit
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _logo(),
              _headerDifficulty(),
              _dropdownMenu(),
              Container(height: 20),
              _headerCategory(),
              Container(height: 10),
              _categoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logo() {
    return Center(child: Image(image: AssetImage('assets/logo.png')));
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
      child: DropdownButton<DifficultyItem>(
        hint: Text(
          'Difficulty',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(fontSize: AppTheme.normalFontSize),
        ),
        value: choosedDifficulty,
        icon: Icon(Icons.arrow_downward, color: AppTheme.primaryTextColor),
        onChanged: (DifficultyItem value) {
          setState(() {
            choosedDifficulty = value;
          });
        },
        items: difficulties.map((DifficultyItem difficulty) {
          return DropdownMenuItem<DifficultyItem>(
            value: difficulty,
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  difficulty.difficultyName,
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
      padding: const EdgeInsets.all(10),
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
          print('Finns det en instans av quizList? : $_quizList');
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

//Hämtar frågorna från TriviaApi & formaterar, samt bygger quizList
  Future _buildQuizList() async {
    if (choosedDifficulty == null) {
      choosedDifficulty = DifficultyItem('easy');
    }
    _quizList = await TriviaApi.getQuiz(
        choosedCategory, choosedDifficulty.difficultyName);
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

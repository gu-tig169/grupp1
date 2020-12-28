import 'package:flutter/material.dart';

import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/API/triviaApi.dart';

class DifficultyItem {
  final String difficultyName;

  const DifficultyItem(this.difficultyName);
}

class CategoryItem {
  final String categoryName;
  final dynamic icon;
  final String urlNumber;

  CategoryItem(this.categoryName, this.icon, this.urlNumber);
}

class SetupQuizView extends StatefulWidget {
  @override
  _SetupQuizViewState createState() => _SetupQuizViewState();
}

class _SetupQuizViewState extends State<SetupQuizView> {
  DifficultyItem choosedDifficulty;
  CategoryItem choosedCategory;

  List<DifficultyItem> difficulties = <DifficultyItem>[
    const DifficultyItem('easy'),
    const DifficultyItem('medium'),
    const DifficultyItem('hard'),
  ];

  final List<CategoryItem> categories = [
    CategoryItem('Random', Icons.help_rounded, '9'),
    CategoryItem('Books', Icons.menu_book, '10'),
    CategoryItem('Film', Icons.videocam, '11'),
    CategoryItem('Board Games', Icons.local_play, '16'),
    CategoryItem('Science & Nature', Icons.opacity, '17'),
    CategoryItem('Computers', Icons.laptop_mac, '18'),
    CategoryItem('Sports', Icons.sports_tennis, '21'),
    CategoryItem('Geography', Icons.public, '22'),
    CategoryItem('Animals', Icons.pets, '27'),
    CategoryItem('Vehicles', Icons.drive_eta, '28'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.0),
        child: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xFF1B5E20),
        ),
      ),
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
          print('${choosedDifficulty.difficultyName}');
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
        onTap: () {
          print('${categoryList.urlNumber}${choosedDifficulty.difficultyName}');
          //getQuiz();
          //byta vy
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
}

/*(CategoryItem value) {
          setState(() {
            choosedCategory = value;
          });
          print('${choosedCatergory.categoryName}');
        },

categories.map((CategoryItem caregory) {
          return DropdownMenuItem<CategoryItem>(
            value: category,
            child: Card(),
          );})
          .toList() */

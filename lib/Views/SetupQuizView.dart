import 'package:flutter/material.dart';
import 'package:Quiz/Template/theme.dart';
import 'QuizView.dart';

class DifficultyItem {
  final String difficultyName;

  const DifficultyItem(this.difficultyName);
}

class CategoryItem {
  final String categoryName;
  final dynamic icon;

  CategoryItem(this.categoryName, this.icon);
}

class SetupQuizView extends StatefulWidget {
  @override
  _SetupQuizViewState createState() => _SetupQuizViewState();
}

class _SetupQuizViewState extends State<SetupQuizView> {
  DifficultyItem choosedDifficulty;
  CategoryItem choosedCategory;

  List<DifficultyItem> difficulties = <DifficultyItem>[
    const DifficultyItem('Easy'),
    const DifficultyItem('Medium'),
    const DifficultyItem('Hard'),
  ];

  final List<CategoryItem> categories = [
    CategoryItem('Random', Icons.help_rounded),
    CategoryItem('Books', Icons.menu_book),
    CategoryItem('Film', Icons.videocam),
    CategoryItem('Board Games', Icons.local_play),
    CategoryItem('Science & Nature', Icons.opacity),
    CategoryItem('Computers', Icons.laptop_mac),
    CategoryItem('Sports', Icons.sports_tennis),
    CategoryItem('Geography', Icons.public),
    CategoryItem('Animals', Icons.pets),
    CategoryItem('Vehicles', Icons.drive_eta),
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

        //Tillfällig kod
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizView(),));},),
        //End
        
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
          print('$categories');
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
        onTap: () {},
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

import 'package:flutter/material.dart';

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
    CategoryItem('Random', Icons.star),
    CategoryItem('Books', Icons.book),
    CategoryItem('Film', Icons.star),
    CategoryItem('Board Games', Icons.star),
    CategoryItem('Science & Nature', Icons.star),
    CategoryItem('Computers', Icons.star),
    CategoryItem('Sports', Icons.star),
    CategoryItem('Geography', Icons.star),
    CategoryItem('Animals', Icons.star),
    CategoryItem('Vehicles', Icons.star),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SetupQuizView'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _image(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('Choose Difficulty:'),
              ),
              _dropdownMenu(),
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Choose Category:'),
              ),
              Container(height: 10),
              Expanded(child: _categoryList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Center(child: Image(image: AssetImage('assets/logo.png')));
  }

  Widget _dropdownMenu() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton<DifficultyItem>(
        hint: Text('Difficulty'),
        value: choosedDifficulty,
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
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _categoryList() {
    //var list = List.generate(10, (index) => '${categoryList[index]}');

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) =>
          _categoryListItem(context, index),
    );
  }

  Widget _categoryListItem(BuildContext context, int index) {
    final categoryList = categories[index];
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: ListTile(
          leading: Icon(categoryList.icon),
          title: Text(categoryList.categoryName),
        ),
      ),
    );
  }
}
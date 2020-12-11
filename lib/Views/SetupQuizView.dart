import 'package:flutter/material.dart';

class SetupQuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SetupQuizView'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Difficulty:'),
          Text('Choose Category:'),
          // _categoryList(context),
        ],
      ),
    );
  }
/*
  Widget _categoryList(context) {
    return 
  } */

  Widget _categoryCard() {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Tapped nature.');
          },
          child: Container(
            width: 313,
            height: 58,
            child: Center(
              child: Text(
                'Nature',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/* Widget extends 
            DropdownButton<String>(             
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
               onChanged: () {},
               items: <String>['Easy', 'Medium', 'Difficult',]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  ) */

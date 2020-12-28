import 'package:Quiz/Template/theme.dart';
import 'package:flutter/material.dart';
import 'package:Quiz/Views/editUserView.dart';
import 'setupQuizView.dart';



class HomeView extends StatefulWidget {
  

  HomeView({Key key,}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {



  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _logo(),
            Container(height: 32),
            _currentHighScore(),
            _userField(),
            _playButton(context),
          ],
        ),
      );
  }

  //logo
  Widget _logo() {
    return Center(
      child: Image(image: AssetImage('assets/logo.png')),
    );
  }

//displays current HighScore
  Widget _currentHighScore() {
    return Container(
      padding: EdgeInsetsDirectional.only(top: 10.0),
      child: Text('HIGH SCORE \n 200',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: AppTheme.largeHeaderFontSize)),
      height: 100,
      width: 314,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFF4C8C4A),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

//Shows userinformation, name & avatar
  Widget _userField() {
    return Container(
      //margin: EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/avatar1.png',
              ),
              radius: 37,
            ),
          ),
          Expanded(
            child: Container(
              child: Text('userName',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontSize: AppTheme.smallFontSize)),
            ),
          ),
          Transform.translate(
            offset: Offset(25, -30),
            child: IconButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                icon: Icon(Icons.edit, color: AppTheme.primaryTextColor),
                iconSize: 20,
                // color: AppTheme.primaryTextColor,
                //better way - call AppTheme
                onPressed: () {
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditUser(),
                      ));

                }
                ),
          )
        ],
      ),
      height: 85,
      width: 314,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFF4C8C4A),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

//Playbutton, sends the user to SetupQuizView
  Widget _playButton(context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 80,
      width: 314,
      child: RaisedButton(
        child: Text('PLAY', style: Theme.of(context).textTheme.subtitle1),
        //copyWith(fontSize: 24),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SetupQuizView()));
        },
      ),
    );
  }
}

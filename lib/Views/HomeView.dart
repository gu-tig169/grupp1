import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Quiz/Views/editUserView.dart';
import 'package:Quiz/Template/theme.dart';
import 'package:Quiz/Template/user.dart';
import 'package:Quiz/model.dart';
import 'setupQuizView.dart';
import 'package:Quiz/main.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key key,
  }) : super(key: key);

  //final User user;

  /*var state = AppState();
  var oldUser;*/

  //@override
  // _HomeViewState createState() => _HomeViewState();
//}

//class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    Provider.of<AppState>(context, listen: false).getUser();
    return Scaffold(
      /* floatingActionButton: FloatingActionButton(
            onPressed: () {
              var state = Provider.of<AppState>(context, listen: false);
              state.removeUser(user);
            },
          ),*/
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logo(),
          Container(height: 32),
          _currentHighScore(context),
          Stack(
            children: [
              _userListItem(),
              //_editButton(context),
            ],
          ),
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
  Widget _currentHighScore(context) {
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

  Widget _userListItem() {
    return Consumer<AppState>(
        builder: (context, state, child) => UserList(state.listUser));
    //'${state.listUser.elementAt(0).userName}'));
  }

  /*Widget _editButton(context) {
    return Container(
        child: Transform.translate(
      offset: Offset(290, -5),
      child: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          icon: Icon(Icons.edit, color: AppTheme.primaryTextColor),
          iconSize: 20,
          onPressed: () async {
            state.getUser();
            print('You should have an instance of a user: ${state.listUser}');
             var updateUser = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditUserView()));
            if (updateUser != null) {
              state.getUser();
               oldUser = state.listUser;
              oldUser = updateUser;
              Provider.of<AppState>(context, listen: false)
                  .updateUser(updateUser);
            }
          }),
    ));
  }*/

  //margin: EdgeInsets.only(top: 20.0),
  //   height: 80,
  // width: 314,
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

import 'package:flutter/material.dart';
import './SetupQuizView.dart';
import 'package:Quiz/editUser.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  /* String valueFromTextField;
  String userName;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B5E20),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 32),
              _image(),
              _container1(),
              _container2(),
              _raisedButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Center(
      child: Image(image: AssetImage('assets/logo.png')),
    );
  }

  Widget _container1() {
    return Container(
      padding: EdgeInsetsDirectional.only(
        top: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('HIGH SCORE',
              style: TextStyle(fontSize: 24, color: Color(0xFFF9A825))),
          //Mellanrum.
          Container(
            padding: EdgeInsetsDirectional.only(
              top: 10.0,
            ),
          ),
          Text('200', style: TextStyle(fontSize: 34, color: Color(0xFFF9A825))),
          //$score (istället för 200)
        ],
      ),
      height: 100,
      width: 314,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFF4C8C4A),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _container2() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/avatar1.png'),
            radius: 37,
          ),
          Text('        Sven Svensson',
              style: TextStyle(fontSize: 16, color: Color(0xFFF9A825))),
          Transform.translate(
            offset: Offset(35, -30),
            child: IconButton(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                icon: Icon(Icons.edit),
                iconSize: 20,
                color: Color(0xFFF9A825),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditUser()));
                }),
          )
        ],
      ),

      /* onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return EditProfile();
                  },
                )).then((valueFromTextField) {
                  setState(() {
                    valueFromTextField = userName;
                  });
*/
      //child: Text('$username'),
      //icon: Icon(Icons.edit),
      height: 85,
      width: 314,
      margin: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: Color(0xFF4C8C4A),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  Widget _raisedButton(context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 80,
      width: 314,
      child: RaisedButton(
        child: Text(
          'PLAY',
          style: TextStyle(fontSize: 24, color: Color(0xFFF9A825)),
        ),
        color: Color(0xFF4A148C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SetupQuizView()));
        },
      ),
    );
  }
}

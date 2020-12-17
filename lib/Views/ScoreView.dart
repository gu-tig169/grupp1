import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score View'),
      ),
      body: Center(
        child: Column(children: [
          _image(),
          Container(
              color: Colors.lightGreen,
              width: 310,
              height: 116,
              child: Row(
                children: [
                  Column(children: [
                    _placeHolderAvatar(),
                    Text('Username'),
                  ]),
                  Container(
                    width: 230,
                    height: 116,
                    color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('BEST CATEGORY'),
                          Text('Fashion'),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }

  Widget _image() {
    return Center(child: Image(image: AssetImage('assets/logo.png')));
  }

  Widget _placeHolderAvatar() {
    //Ta bort sedan!
    return Center(
      child: Image(
        image: AssetImage('assets/logo.png'),
        height: 80,
        width: 80,
      ),
    );
  }
}

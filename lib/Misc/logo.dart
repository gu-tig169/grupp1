import 'package:flutter/material.dart';

Widget smallLogo() {
  return Center(
    child: Image(
      image: AssetImage('assets/logo.png'),
      height: 80,
      width: 80,
    ),
  );
}

Widget bigLogo() {
  return Center(child: Image(image: AssetImage('assets/logo.png')));
}



import 'package:flutter/material.dart';

AppBar appBarTitle(String title){
  return AppBar(
    centerTitle: true,
    title: _textTitle(title),
  );
}

Widget _textTitle(String title) {
  return Text(
    title,
    style: TextStyle(
      color: Colors.yellowAccent[400],
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
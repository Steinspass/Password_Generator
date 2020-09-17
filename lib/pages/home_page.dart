import 'package:flutter/material.dart';
import 'package:password_generator/widget/app_bar_widget.dart';
import 'package:password_generator/widget/card_password_generator.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: appBarTitle('Password Genarators'),
      body: BuildCardGetPassword(),
    );
  }
}
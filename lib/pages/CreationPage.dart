// ignore: avoid_web_libraries_in_flutter
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullstock/constants/FullStockColors.dart';

class CreationPage extends StatefulWidget {
  final String title;

  CreationPage({Key key, this.title}) : super(key: key);

  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(FullStockColors.DARK_PRIMARY),
      appBar: AppBar(
        backgroundColor: Color(FullStockColors.DARK_PRIMARY),
        title: Text(widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                shadows: [Shadow(blurRadius: 2.0, offset: Offset(2.0, 2.0))],
                fontWeight: FontWeight.bold,
                fontSize: 28)),
      ),
      body: Hero(
        tag: 'creation',
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color(FullStockColors.DARK_PRIMARY),
                Color(FullStockColors.PRIMARY),
                Color(FullStockColors.LIGHT_PRIMARY),
                Colors.white
              ],
            )),
            padding: EdgeInsets.all(10.0),
          ),
        ),
      ),
    );
  }
}

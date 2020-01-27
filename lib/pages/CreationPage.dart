// ignore: avoid_web_libraries_in_flutter
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreationPage extends StatefulWidget {
  final String title;

  CreationPage({Key key, this.title}) : super(key: key);

  @override
  _CreationPageState createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  static const AZULAO = 0XFF2E80B3;
  static const AZULZIN = 0XFF75CAFF;
  static const OTOAZUL = 0XFF5DC1FF;
  static const COR_DO_AFRONOQUIO = 0XFFB37216;
  static const COR_DO_PINOQUIO = 0XFFFFBB5C;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AZULAO),
      appBar: AppBar(
        backgroundColor: Color(OTOAZUL),
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
              colors: [Color(AZULAO), Color(AZULZIN), Colors.white],
            )),
            padding: EdgeInsets.all(10.0),
          ),
        ),
      ),
    );
  }
}

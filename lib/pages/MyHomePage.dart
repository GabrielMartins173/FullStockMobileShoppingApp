// ignore: avoid_web_libraries_in_flutter
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullstock/Request.dart';

import '../constants/FullStockColors.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Request> TEST_REQUEST_LIST = [
    new Request('Pães', 8, 'u', Icons.favorite),
    new Request('Leite', 12, 'u', Icons.sentiment_dissatisfied),
    new Request('Queijo', 200, 'g', Icons.sentiment_very_satisfied),
    new Request('Presunto', 200, 'g', Icons.sentiment_neutral),
    new Request('Margarina', 1, 'u', Icons.sentiment_satisfied),
    new Request('arroz', 1, 'kg', Icons.sentiment_satisfied),
    new Request('feijão', 1, 'kg', Icons.sentiment_very_satisfied),
    new Request('smudge', 1, 'u', Icons.sentiment_satisfied),
    new Request('egdums', 1, 'u', Icons.sentiment_neutral)
  ];

  List<Widget> generateRequestList(List<Request> requestList) {
    List<Widget> containerList = new List();

    containerList.add(Text(
      'List of requests',
      style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          shadows: [Shadow(blurRadius: 2.0, offset: Offset(2.0, 2.0))],
          fontWeight: FontWeight.bold,
          fontSize: 28),
    ));
    containerList.add(SizedBox(height: 10.0));
    for (Request request in requestList) {
      containerList.add(
        Container(
          width: double.infinity,
          height: 70.0,
          child: RaisedButton(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Color(FullStockColors.COR_DO_PINOQUIO),
            animationDuration: Duration(seconds: 1),
            colorBrightness: Brightness.dark,
            highlightColor: Color(FullStockColors.COR_DO_AFRONOQUIO),
            splashColor: Color(FullStockColors.COR_DO_AFRONOQUIO),
            textTheme: ButtonTextTheme.accent,
            elevation: 4.0,
            highlightElevation: 0.0,
            onPressed: () {
              print("Smudge is my lord");
            },
            onLongPress: () {
              print("Smudge is my life");
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    request.icon,
                    //color: Colors.pink,
                    size: 24.0,
                    semanticLabel: 'icon',
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    width: 180.0,
                    child: Text(
                      request.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Righteous',
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(blurRadius: 2.0, offset: Offset(2.0, 2.0))
                          ],
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                  ),
                  Text(
                    request.quantity.toString() + ' ' + request.quantification,
                    softWrap: true,
                    style: TextStyle(
                        fontFamily: 'Righteous',
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(blurRadius: 2.0, offset: Offset(2.0, 2.0))
                        ],
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ]),
          ),
        ),
      );

      containerList.add(SizedBox(height: 10.0));
    }
    containerList.add(SizedBox(height: 100.0));
    return containerList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(FullStockColors.AZULAO),
      appBar: AppBar(
        backgroundColor: Color(FullStockColors.OTOAZUL),
        title: Text(widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Courgette',
                shadows: [Shadow(blurRadius: 2.0, offset: Offset(2.0, 2.0))],
                fontWeight: FontWeight.bold,
                fontSize: 28)),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(FullStockColors.AZULAO),
              Color(FullStockColors.AZULZIN),
              Colors.white
            ],
          )),
          padding: EdgeInsets.all(10.0),
          child: ListView(
            controller: ScrollController(initialScrollOffset: 0.0),
            children: generateRequestList(TEST_REQUEST_LIST),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          elevation: 8.0,
          highlightElevation: 1.0,
          onPressed: () {},
          child: Icon(Icons.add)),
    );
  }
}

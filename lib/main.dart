// ignore: avoid_web_libraries_in_flutter
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Stock',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Fullstock Shopping app'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const AZULAO = 0XFF2E80B3;
  static const AZULZIN = 0XFF75CAFF;
  static const OTOAZUL = 0XFF5DC1FF;
  static const COR_DO_AFRONOQUIO = 0XFFB37216;
  static const COR_DO_PINOQUIO = 0XFFFFBB5C;
  static const List<String> TEST_REQUEST_LIST = [
    'Pães',
    'Leite',
    'Queijo',
    'Presunto',
    'Margarina'
  ];

  List<Widget> generateRequestList(List<String> requestList) {
    List<Widget> containerList = new List();

    containerList.add(Text('List of requests'));
    containerList.add(SizedBox(height: 10.0));

    for (String request in requestList) {
      containerList.add(
        Container(
          width: double.infinity,
          height: 70.0,
          child: RaisedButton(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            color: Color.alphaBlend(Color(COR_DO_PINOQUIO), Color(AZULAO)),
            highlightColor: Color(COR_DO_AFRONOQUIO),
            splashColor: Color(COR_DO_AFRONOQUIO),
            textTheme: ButtonTextTheme.accent,
            elevation: 12.0,
            highlightElevation: 1.0,
            onPressed: () {
              print("Smudge is my lord");
            },
            onLongPress: () {
              print("Smudge is my life");
            },
            child: Row(children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
                semanticLabel: 'heart icon',
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                request,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(blurRadius: 2.0, offset: Offset(2.0, 2.0))
                    ],
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
              ),
            ]),
          ),
        ),
      );

      containerList.add(SizedBox(height: 10.0));
    }
    return containerList;
  }

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
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(AZULZIN), Color(AZULAO)],
          )),
          padding: EdgeInsets.all(10.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: generateRequestList(TEST_REQUEST_LIST),
          ),
        ),
      ),
    );
  }
}

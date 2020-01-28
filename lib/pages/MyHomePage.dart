// ignore: avoid_web_libraries_in_flutter
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullstock/Request.dart';
import 'package:fullstock/constants/FoodIcons.dart';

import '../constants/FullStockColors.dart';
import 'CreationPage.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Request> requestList = [
    new Request('Pães', 8, 'u', FoodIcons.BREAD),
    new Request('Leite', 12, 'u', FoodIcons.TEA),
    new Request('Queijo', 200, 'g', FoodIcons.CHEESE),
    new Request('Presunto', 200, 'g', FoodIcons.CHEESE),
    new Request('Margarina', 1, 'u', FoodIcons.BREAD),
    new Request('arroz', 1, 'kg', FoodIcons.BREAD),
    new Request('feijão', 1, 'kg', FoodIcons.CHEESE),
    new Request('smudge', 1, 'u', FoodIcons.CHEESE),
    new Request('egdums', 1, 'u', FoodIcons.TEA)
  ];

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
              Color(FullStockColors.PRIMARY),
              Color(FullStockColors.LIGHT_PRIMARY),
              Colors.white
            ],
          )),
          padding: EdgeInsets.all(10.0),
          child: ListView(
            controller: ScrollController(initialScrollOffset: 0.0),
            children: generateRequestList(requestList),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(FullStockColors.PRIMARY),
          elevation: 8.0,
          highlightElevation: 1.0,
          onPressed: () {
            setState(() {
              requestList
                  .add(new Request('new column', 0, 'x.', FoodIcons.BREAD));
            });
            /*Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreationPage()),
            );*/
          },
          child: Icon(Icons.add)),
    );
  }

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
      containerList.add(generateRequestContainer(request));

      containerList.add(SizedBox(height: 10.0));
    }
    containerList.add(SizedBox(height: 100.0));
    return containerList;
  }

  Container generateRequestContainer(Request request) {
    return Container(
      width: double.infinity,
      height: 70.0,
      child: RaisedButton(
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
        padding: EdgeInsets.all(0),
        clipBehavior: Clip.hardEdge,
        color: Color(FullStockColors.ACCENT),
        animationDuration: Duration(seconds: 1),
        colorBrightness: Brightness.dark,
        highlightColor: Color(FullStockColors.LIGHT_ACCENT),
        splashColor: Color(FullStockColors.LIGHT_ACCENT),
        elevation: 4.0,
        highlightElevation: 0.0,
        onPressed: () {
          print("Smudge is my lord");
        },
        onLongPress: () {
          setState(() {
            requestList.remove(request);
          });
        },
        child: Ink(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 70,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              gradient: LinearGradient(colors: [
                Color(FullStockColors.ACCENT),
                Color(FullStockColors.LIGHT_ACCENT)
              ])),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'icons/food/' + request.icon,
                  scale: 10,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 150.0,
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
                Container(
                  width: 60.0,
                  child: Text(
                    request.quantity.toStringAsFixed(0) +
                        ' ' +
                        request.quantification,
                    textAlign: TextAlign.right,
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
                ),
              ]),
        ),
      ),
    );
  }
}

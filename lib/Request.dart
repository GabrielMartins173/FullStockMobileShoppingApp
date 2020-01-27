// ignore: avoid_web_libraries_in_flutter
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Request {
  String title;
  double quantity;
  String quantification;
  double priority;
  IconData icon;

  Request(this.title, this.quantity, this.quantification, this.icon);
}
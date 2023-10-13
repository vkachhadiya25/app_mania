import 'package:flutter/material.dart';
import 'package:salad/screen/cartscreen.dart';
import 'package:salad/screen/foodpage.dart';
import 'package:salad/screen/homepage.dart';


void main() {
  runApp(MaterialApp(
    // home: cart(),
    routes: {
      '/': (Context) => homepage(),
      'profile': (Context) => foodpage(),
      'cart': (Context) => cartscreen(),

    },
    debugShowCheckedModeBanner: false,
  ));
}

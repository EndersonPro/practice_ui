import 'package:flutter/material.dart';
import 'package:flutter_ui/src/pages/animation_page.dart';
import 'package:flutter_ui/src/pages/header_page.dart';
import 'package:flutter_ui/src/pages/login_page_one.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationPage()
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_ui/src/widget/header.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderWave(),
    );
  }
}
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CiruclarProgressPage extends StatefulWidget {
  const CiruclarProgressPage({Key key}) : super(key: key);

  @override
  _CiruclarProgressPageState createState() => _CiruclarProgressPageState();
}

class _CiruclarProgressPageState extends State<CiruclarProgressPage> with SingleTickerProviderStateMixin {

  AnimationController controller;

  double percentage = 0.0;
  double newPercentage = 0.0; 

  @override
  void initState() {
    // TODO: implement initState
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            child: Center(
              child: Container(
                height: 300,
                width: 300,
                // color: Colors.red,
                padding: EdgeInsets.all(5),
                child: CustomPaint(
                  painter: _MyRadialProgress(percentage),
                ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {

            controller.forward(from: 0.0);

            setState(() {
              percentage = newPercentage;
              newPercentage += 10.0;
              if (newPercentage > 100) {
                newPercentage = 0.0;
                percentage = 0.0;
              }
            });
        },
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;

  _MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canva, Size size) {

    final paint = new Paint()
      ..strokeWidth = 2
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canva.drawCircle(center, radius, paint);

    // Arco
    final paintArco = new Paint()
            ..strokeWidth = 4
            ..color = Colors.blueAccent
            ..style = PaintingStyle.stroke;
    
    final arcAngle = 2 * pi * (percentage / 100);
    canva.drawArc(
      Rect.fromCircle(radius: radius, center: center), 
      -pi * 0.5, 
      arcAngle, 
      false, 
      paintArco);

  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}
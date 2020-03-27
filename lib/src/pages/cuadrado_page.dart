import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado()),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> traslateX;
  Animation<double> traslateXOut;
  Animation<double> traslateY;
  Animation<double> traslateYOut;


  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    traslateX = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      curve: Interval(0, 0.25, curve: Curves.bounceOut),
      parent: controller,
    ));

    traslateY = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      curve: Interval(0.25, 0.50, curve: Curves.bounceOut),
      parent: controller,
    ));

    traslateXOut = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      curve: Interval(0.50, 0.75, curve: Curves.bounceOut),
      parent: controller,
    ));

    traslateYOut = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
      parent: controller,
    ));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) controller.reset();
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

    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Cuadrado(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(traslateX.value - traslateXOut.value, traslateY.value - traslateYOut.value),
          child: child,
        );
      },
    );
  }
}

class _Cuadrado extends StatelessWidget {
  const _Cuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.redAccent),
    );
  }
}

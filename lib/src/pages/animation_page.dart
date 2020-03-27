import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationPage extends StatelessWidget {
  const AnimationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> mover;
  Animation<double> agrandar;

  @override
  void initState() {
    // vsync
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 0.25, curve: Curves.easeOut),
    ));

    opacidadOut = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.75, 1.0, curve: Curves.easeOut),
    ));

    mover = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    animationController.addListener(() {
      final status = animationController.status;
      switch (status) {
        case AnimationStatus.completed:
          animationController.reverse();
          break;
        default:
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(mover.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: child,
              ),
            ),
          ),
        );
      },
    );
    // return _Rectangulo();
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.redAccent),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_ui/src/widget/header.dart';

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

  @override
  void initState() {
    // vsync
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0).animate(animationController);

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
      builder: (BuildContext context, Widget child) {
        print('Valor: ' + rotacion.value.toString());
        return Transform.rotate(
          angle: rotacion.value,
          child: _Rectangulo(),
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

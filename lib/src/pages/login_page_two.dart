import 'package:flutter/material.dart';

class LoginPageTwo extends StatelessWidget {
  const LoginPageTwo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(body: LoginPageAnimated(size: size));
  }
}

class LoginPageAnimated extends StatefulWidget {
  const LoginPageAnimated({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _LoginPageAnimatedState createState() => _LoginPageAnimatedState();
}

class _LoginPageAnimatedState extends State<LoginPageAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> loginAnimation;
  Animation<double> opacidad;
  Animation<double> opacidadOut;

  final int allMilliseconds = 250;

  @override
  void initState() {
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: allMilliseconds));

    loginAnimation = Tween(begin: 0.0, end: 0.5).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOutExpo));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.75, curve: Curves.easeOutExpo),
    ));

    opacidadOut = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.75, 1.0, curve: Curves.easeOut),
    ));

    controller.addListener(() {
      print('Estado: ${controller.status}');
      print('Current ${loginAnimation.value}');
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
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: allMilliseconds),
              height: widget.size.height -
                  (widget.size.height * loginAnimation.value),
              width: widget.size.width,
              color: Color(0xFF2E323E),
              child: CustomPaint(
                painter: _HeaderLoginPainter(),
                child: Column(
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: allMilliseconds),
                      height: (widget.size.height * 0.8) -
                          (widget.size.height * loginAnimation.value),
                      width: widget.size.width,
                      child: Center(
                        child: Text('Hola'),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: allMilliseconds),
                      height: (widget.size.height * 0.2),
                      width: widget.size.width,
                      child: opacidad.value == 1.0
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                if (controller.status ==
                                    AnimationStatus.completed)
                                  controller.reset();
                                else
                                  controller.forward();
                              },
                              child: Opacity(
                                opacity: 1.0 - opacidad.value,
                                child: Center(
                                  child: Text(
                                    'Inicia Sesion En Tu Cuenta',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: allMilliseconds),
              height: (widget.size.height * loginAnimation.value),
              width: widget.size.width,
              color: Color(0xFF2E323E),
              child: Container(
                width: widget.size.width,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        if (controller.status == AnimationStatus.completed)
                          controller.reset();
                      },
                      child: Center(
                          child: Text(
                        'Iniciar Sesion',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HeaderLoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path = new Path();
    final Paint paint = new Paint();

    paint.color = Color(0xFF295EC8);
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.fill;

    path.lineTo(0, size.height * 0.82);
    path.quadraticBezierTo(size.width * ((1 / 12) / 2), size.height * 0.88,
        size.width * (1 / 6), size.height * 0.88);
    path.lineTo(size.width - size.width * (1 / 6), size.height * 0.88);
    path.quadraticBezierTo(size.width - size.width * ((1 / 12) / 2),
        size.height * 0.88, size.width, size.height * 0.94);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

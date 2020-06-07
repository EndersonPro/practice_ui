import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ));
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    paint.color = Colors.redAccent;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = new Path();

    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true; // TODO: Usar true por defecto para cualquier diseño
  }
}

class HeaderTriangular extends StatelessWidget {
  const HeaderTriangular({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        ));
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Colors.pinkAccent;
    paint.style = PaintingStyle.fill;

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderPicoPainter(),
        ));
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Colors.lime;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 30;

    path.lineTo(0, size.height * .32);
    path.lineTo(size.width * .5, size.height * .4);
    path.lineTo(size.width, size.height * .32);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderCurvoPainter(),
        ));
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Colors.lightGreen;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    path.lineTo(0, size.height * .32);
    path.quadraticBezierTo(
        size.width * .5, size.height * .5, size.width, size.height * .32);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomPaint(
          painter: _HeaderWavePainter(),
        ));
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = Colors.indigoAccent;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    path.lineTo(0, size.height * .3);
    path.quadraticBezierTo(
        size.width * .25, size.height * .35, size.width * .5, size.height * .3);
    path.quadraticBezierTo(
        size.width * .75, size.height * .25, size.width, size.height * .3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const IconHeader(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.subtitle,
      this.color1 = Colors.grey,
      this.color2 = Colors.blueGrey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _IconHeaderBackgroud(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
          child: FaIcon(this.icon,
              size: 200, color: Colors.white.withOpacity(0.2)),
          top: -50,
          left: -50,
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 80, width: double.infinity),
            Text(
              this.subtitle,
              style:
                  TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7)),
            ),
            SizedBox(height: 20),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FaIcon(this.icon, size: 80, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackgroud extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackgroud({
    Key key,
    this.color1,
    this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                this.color1,
                this.color2
              ])),
    );
  }
}

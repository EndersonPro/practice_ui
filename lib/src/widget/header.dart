import 'dart:ui';
import 'package:flutter/material.dart';


class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      )
    );
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
      )
    );
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
      )
    );
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
      )
    );
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
    path.quadraticBezierTo(size.width * .5, size.height * .5, size.width, size.height * .32);
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
      )
    );
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
    path.quadraticBezierTo(size.width * .25, size.height * .35, size.width * .5, size.height * .3);
    path.quadraticBezierTo(size.width * .75, size.height * .25, size.width, size.height * .3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  
}

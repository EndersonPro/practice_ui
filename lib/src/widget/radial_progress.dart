import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final colorPrimary;
  final colorSecundary;
  final double thicknessPrimary;
  final double thicknessSecondary;
  final duration;

  RadialProgress(
      {Key key,
      @required this.percentage,
      this.colorPrimary = Colors.blue,
      this.colorSecundary = Colors.grey,
      this.thicknessPrimary = 4.0,
      this.thicknessSecondary = 4.0,
      this.duration = 200})
      : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  double prevPercentage;
  AnimationController controller;

  @override
  void initState() {
    prevPercentage = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diffPercentage = widget.percentage - prevPercentage;
    prevPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              (widget.percentage - diffPercentage) +
                  diffPercentage * controller.value,
              widget.colorPrimary,
              widget.colorSecundary,
              widget.thicknessPrimary,
              widget.thicknessSecondary,
            ),
          ),
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;
  final colorPrimary;
  final colorSecundary;
  final double thicknessPrimary;
  final double thicknessSecondary;

  _MyRadialProgress(this.percentage, this.colorPrimary, this.colorSecundary,
      this.thicknessPrimary, this.thicknessSecondary);

  @override
  void paint(Canvas canva, Size size) {
    final paint = new Paint()
      ..strokeWidth = this.thicknessSecondary
      ..color = this.colorSecundary
      ..style = PaintingStyle.stroke;

    final center = new Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canva.drawCircle(center, radius, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = this.thicknessPrimary
      ..color = this.colorPrimary
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (percentage / 100);
    canva.drawArc(Rect.fromCircle(radius: radius, center: center), -pi * 0.5,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

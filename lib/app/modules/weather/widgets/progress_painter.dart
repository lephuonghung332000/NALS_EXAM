import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_template/app/theme/theme.dart';

class ProgressPainter extends CustomPainter {
  final value;
  final total;
  final color;
  double pi = math.pi;

  ProgressPainter({this.value, this.total, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 5;
    Rect myRect =
        Offset(size.width *0.18, size.height *0.32) & Size(size.width, size.height);
    var paint1 = Paint()
      ..color = color.withOpacity(0.2)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paint2 = Paint()
      ..color = kColorWhite
      ..strokeWidth = strokeWidth + 2
      ..style = PaintingStyle.stroke;

    double firstLineRadianStart = 5 / 6 * math.pi;
    double firstLineRadianEnd = 4 / 3 * math.pi;
    canvas.drawArc(
        myRect, firstLineRadianStart, firstLineRadianEnd, false, paint1);
    double _learned = (value / total)*69;
    double secondLineRadianEnd = getRadians(_learned);
    canvas.drawArc(
        myRect, firstLineRadianStart, secondLineRadianEnd, false, paint2);
    Paint paint = Paint()..color = kColorWhite;
    Offset center = new Offset(0.68 * size.width, 0.82 * size.height);
    double radius = math.min(size.width * 0.43, size.height * 0.43);
    canvas.drawCircle(center, radius, paint);
  }

  double getRadians(double value) {
    return (360 * value) * pi / 180;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

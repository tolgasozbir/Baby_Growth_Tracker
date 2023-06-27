import 'package:flutter/material.dart';

class WavePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Paint paint = Paint()
      ..color = const Color(0xFFE7E7E7)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(width, 0);
    path.lineTo(width, height * 0.5);
    path.quadraticBezierTo(width * 0.7, height * 0.28, width * 0.5, height * 0.67);
    path.quadraticBezierTo(width* 0.25, height * 1,0, height * 0.64);
    path.lineTo(0,0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
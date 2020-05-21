import 'dart:ui';

import 'package:custom_shapes/src/shape_screen.dart';
import 'package:flutter/material.dart';

class CircleScreen extends StatelessWidget {
  const CircleScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShapeScreen(
      body: CustomPaint(
        painter: const CirclePainter(),
        child: Container(
          height: 700,
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  const CirclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.green;
    var center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, 150, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

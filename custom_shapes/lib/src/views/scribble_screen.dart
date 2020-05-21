import 'dart:math';

import 'package:custom_shapes/src/shape_screen.dart';
import 'package:flutter/material.dart';

class ScribbleScreen extends StatelessWidget {
  const ScribbleScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShapeScreen(
      body: Center(
        child: const CustomPaint(
          painter: const ScribblePainter(),
          size: Size.square(300),
        ),
      ),
    );
  }
}

class ScribblePainter extends CustomPainter {
  const ScribblePainter();

  @override
  void paint(Canvas canvas, Size size) {
    var random = Random();
    var paint = Paint();

    for (int i = 0; i < 1000; i++) {
      var x1 = size.width * random.nextDouble();
      var y1 = size.width * random.nextDouble();
      var x2 = size.width * random.nextDouble();
      var y2 = size.width * random.nextDouble();
      paint.color = Color(0xFF000000 | random.nextInt(0xFFFFFff));
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

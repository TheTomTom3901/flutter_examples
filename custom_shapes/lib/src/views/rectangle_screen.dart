import 'package:custom_shapes/src/shape_screen.dart';
import 'package:custom_shapes/src/views/circle_screen.dart';
import 'package:flutter/material.dart';

class RectangleScreen extends StatelessWidget {
  const RectangleScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShapeScreen(
      body: CustomPaint(
        painter: const RectanglePainter(),
        child: Container(
          height: 700,
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  const RectanglePainter();
  
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);
    CirclePainter().paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

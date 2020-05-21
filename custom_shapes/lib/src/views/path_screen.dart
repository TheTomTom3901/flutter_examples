import 'package:custom_shapes/src/shape_screen.dart';
import 'package:custom_shapes/src/views/views.dart';
import 'package:flutter/material.dart';

class PathScreen extends StatelessWidget {
  const PathScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShapeScreen(
      body: CustomPaint(
        painter: const PathPainter(),
        child: Container(
          height: 700,
        ),
      ),
    );
  }
}

class PathPainter extends CustomPainter {
  const PathPainter();

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, Paint()..color = Colors.white);

    var paint = Paint()..color = Colors.blue;
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);

    CirclePainter().paint(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

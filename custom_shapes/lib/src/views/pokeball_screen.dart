import 'package:custom_shapes/src/shape_screen.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' show radians;

class PokeballScreen extends StatelessWidget {
  const PokeballScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShapeScreen(
      body: CustomPaint(
        painter: const PokeballPainter(
          radius: 150,
        ),
        child: Container(
          height: 700,
        ),
      ),
    );
  }
}

class PokeballPainter extends CustomPainter {
  final double radius;

  const PokeballPainter({
    @required this.radius,
  }) : assert(radius != null);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.black;
    var center = Offset(size.width / 2, size.height / 2);
    var circle = Rect.fromCircle(center: center, radius: radius);

    canvas.drawCircle(center, radius * 1.1, paint);
    canvas.drawArc(circle, radians(180), radians(180), false, paint..color = Colors.red);
    canvas.drawArc(circle, radians(0), radians(180), false, paint..color = Colors.white);

    canvas.drawLine(
        Offset(center.dx - radius, center.dy),
        Offset(center.dx + radius, center.dy),
        paint
          ..color = Colors.black
          ..strokeWidth = radius / 10);
    canvas.drawCircle(center, radius / 3, paint);
    canvas.drawCircle(center, radius / 4, paint..color = Colors.white);
    canvas.drawCircle(center, radius / 7, paint..color = Colors.black);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

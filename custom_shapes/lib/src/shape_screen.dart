import 'package:custom_shapes/src/custom_shapes_app.dart';
import 'package:custom_shapes/src/shape_drawer.dart';
import 'package:flutter/material.dart';

class ShapeScreen extends StatelessWidget {
  final Widget body;

  const ShapeScreen({
    Key key,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
      ),
      drawer: const ShapeDrawer(),
      body: body,
    );
  }
}

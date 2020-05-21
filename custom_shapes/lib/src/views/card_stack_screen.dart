import 'package:custom_shapes/src/shape_screen.dart';
import 'package:flutter/material.dart';

class CardStackScreen extends StatelessWidget {
  const CardStackScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShapeScreen(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          StackedCard(
            top: 25,
            width: 200,
            height: 300,
            color: Colors.red,
            elevation: 2,
          ),
          StackedCard(
            top: 20,
            width: 220,
            height: 300,
            color: Colors.green,
            elevation: 4,
          ),
          StackedCard(
            top: 15,
            width: 240,
            height: 300,
            color: Colors.yellow,
            elevation: 2,
          ),
          StackedCard(
            top: 10,
            width: 260,
            height: 300,
            color: Colors.blue,
            elevation: 4,
          ),
        ],
      ),
    );
  }
}

class StackedCard extends StatelessWidget {
  final double top;
  final double width;
  final double height;
  final Color color;
  final double elevation;

  const StackedCard({
    Key key,
    this.top,
    this.width,
    this.height,
    this.color,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.0, top / 100),
      child: Draggable(
        axis: Axis.horizontal,
        data: Scrollable,
        childWhenDragging: Container(),
        feedback: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: width,
            height: height,
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.35,
              child: Container(
                color: Colors.white,
                child: FlutterLogo(),
              ),
            ),
          ),
          color: color,
          elevation: elevation,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: width,
            height: height,
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.35,
              child: Container(
                color: Colors.white,
                child: FlutterLogo(),
              ),
            ),
          ),
          color: color,
          elevation: elevation,
        ),
      ),
    );
  }
}
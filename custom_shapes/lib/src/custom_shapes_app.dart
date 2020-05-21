import 'package:custom_shapes/src/views/views.dart';
import 'package:flutter/material.dart';

const TITLE = 'Custom Shapes App';

class CustomShapesApp extends StatelessWidget {
  const CustomShapesApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      initialRoute: 'pokeball',
      routes: {
        'circle': (context) => const CircleScreen(),
        'rectangle': (context) => const RectangleScreen(),
        'path': (context) => const PathScreen(),
        'pokeball': (context) => const PokeballScreen(),
        'scribble': (context) => const ScribbleScreen(),
        'cards': (context) => const CardStackScreen(),
        'cardpage': (context) => const CardPageScreen(),
      },
      theme: ThemeData.dark(),
    );
  }
}

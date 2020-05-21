import 'package:flutter/material.dart';

class ShapeDrawer extends StatelessWidget {
  const ShapeDrawer({
    Key key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            DrawerTile(title: 'Circle', routeName: 'circle'),
            DrawerTile(title: 'Rectangle', routeName: 'rectangle'),
            DrawerTile(title: 'Path', routeName: 'path'),
            DrawerTile(title: 'Pokeball', routeName: 'pokeball'),
            DrawerTile(title: 'Scribble', routeName: 'scribble'),
            DrawerTile(title: 'Card Stack', routeName: 'cards'),
            DrawerTile(title: 'Card Page', routeName: 'cardpage'),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title, routeName;

  const DrawerTile({
    Key key,
    this.title,
    this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.pushNamed(context, routeName),
    );
  }
}

import 'package:flutter/material.dart';

Type _typeOf<T>() => T;

abstract class BloCBase {
  void dispose();
}

class BloCProvider<T extends BloCBase> extends StatefulWidget {
  BloCProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BloCProviderState<T> createState() => _BloCProviderState<T>();

  static T of<T extends BloCBase>(BuildContext context){
    final type = _typeOf<_BloCProviderInherited<T>>();
    _BloCProviderInherited<T> provider =
        context.ancestorInheritedElementForWidgetOfExactType(type)?.widget;
    return provider?.bloc;
  }
}

class _BloCProviderState<T extends BloCBase> extends State<BloCProvider<T>>{
  @override
  void dispose(){
    widget.bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return new _BloCProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BloCProviderInherited<T> extends InheritedWidget {
  _BloCProviderInherited({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BloCProviderInherited oldWidget) => false;
}
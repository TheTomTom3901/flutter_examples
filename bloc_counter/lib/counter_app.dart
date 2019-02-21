import 'package:bloc_counter/counter_bloc.dart';
import 'package:common/bloc_provider.dart';
import 'package:flutter/material.dart';

const TITLE = 'BloC Counter Example';

class BloCCounterApp extends StatelessWidget {
  final CounterBloC bloc;

  const BloCCounterApp({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: BloCProvider(
        child: const BloCCounterPage(),
        bloc: bloc,
      ),
    );
  }
}

class BloCCounterPage extends StatelessWidget {
  const BloCCounterPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloC bloc = BloCProvider.of<CounterBloC>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Counter number:'),
            StreamBuilder<int>(
              stream: bloc.outCounter,
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            )
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        FloatingActionButton(
          onPressed: bloc.increment,
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: bloc.decrement,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}

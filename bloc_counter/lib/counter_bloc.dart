import 'dart:async';

import 'package:common/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloC implements BloCBase {
  final BehaviorSubject<int> _counter = BehaviorSubject<int>(seedValue: 0);
  StreamSink<int> get _inCounter => _counter.sink;
  Observable<int> get outCounter => _counter.stream;

  void increment() => _inCounter.add(++_counter.value);

  void decrement() => _inCounter.add(--_counter.value);

  @override
  void dispose() {
    _counter.close();
  }
}
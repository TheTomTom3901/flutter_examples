import 'package:bloc_counter/counter_app.dart';
import 'package:bloc_counter/counter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  final CounterBloC counterBloc = CounterBloC();

  runApp(BloCCounterApp(bloc: counterBloc));
}

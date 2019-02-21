import 'package:bloc_login/login_app.dart';
import 'package:bloc_login/login_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  final LoginBloC loginBloc = LoginBloC();

  runApp(BloCLoginApp(bloc: loginBloc));
}

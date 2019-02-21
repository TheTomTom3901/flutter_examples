import 'package:bloc_login/login_bloc.dart';
import 'package:common/bloc_provider.dart';
import 'package:flutter/material.dart';

const TITLE = 'BloC Login Example';

class BloCLoginApp extends StatelessWidget {
  final LoginBloC bloc;

  const BloCLoginApp({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: BloCProvider(
        child: const BloCLoginPage(),
        bloc: bloc,
      ),
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
    );
  }
}

class BloCLoginPage extends StatelessWidget {
  const BloCLoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginBloC bloc = BloCProvider.of<LoginBloC>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            StreamBuilder<String>(
              stream: bloc.outUsername,
              builder: (context, snapshot) {
                return TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    errorText: snapshot.error,
                  ),
                  onChanged: bloc.updateUsername,
                );
              },
            ),
            StreamBuilder<String>(
              stream: bloc.outPassword,
              builder: (context, snapshot) {
                return TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: snapshot.error,
                  ),
                  onChanged: bloc.updatePassword,
                );
              },
            ),
            StreamBuilder<bool>(
              stream: bloc.isValid,
              builder: (context, snapshot) {
                return FlatButton(
                  child: const Text('LOGIN'),
                  color: Theme.of(context).primaryColor,
                  disabledColor: Colors.grey.withOpacity(0.5),
                  onPressed: snapshot.hasData ? bloc.submit : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const TITLE = 'Date Time App';

class DateTimeApp extends StatelessWidget {
  const DateTimeApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: const DateTimePage(),
      theme: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
    );
  }
}

class DateTimePage extends StatelessWidget {
  const DateTimePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder<String>(
            stream: Stream.periodic((Duration(seconds: 1)), (index) {
              return DateFormat('EEEE, dd MMMM yyyy - kk:mm:ss').format(DateTime.now());
            }),
            builder: (context, snapshot) {
              return Center(
                child: Chip(
                  avatar: const Icon(Icons.timer),
                  label: Text(
                    '${snapshot.data ?? 'No time to display'}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

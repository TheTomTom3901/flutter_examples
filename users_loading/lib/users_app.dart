import 'package:flutter/material.dart';
import 'package:users_loading/model/users.dart';
import 'package:users_loading/user_service.dart';

const TITLE = 'Users Loading Example';

class UsersApp extends StatelessWidget {
  const UsersApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: Scaffold(
        body: Center(
          child: const UserLoading(),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

class UserLoading extends StatelessWidget {
  const UserLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Users>(
      future: getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return UserList(users: snapshot.data.users);
        }

        if (snapshot.hasError) {
          return const LoadingError();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation(Colors.green));
        }

        return const Text('No users shown');
      },
    );
  }
}

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({
    Key key,
    this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, i) {
        return UserTile(
          user: users[i],
        );
      },
    );
  }
}

class UserTile extends StatelessWidget {
  final User user;

  const UserTile({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          child: const Icon(Icons.person),
        ));
  }
}

class LoadingError extends StatelessWidget {
  const LoadingError({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ),
        const Text(
          'Could not find users',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}

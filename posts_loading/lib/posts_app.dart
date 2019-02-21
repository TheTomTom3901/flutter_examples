import 'package:flutter/material.dart';
import 'package:posts_loading/model/post.dart';
import 'package:posts_loading/posts_service.dart';

const TITLE = 'Posts Loading Example';

class PostsApp extends StatelessWidget {
  final PostsService service;

  const PostsApp({
    Key key,
    @required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      home: PostsPage(service: service),
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}

class PostsPage extends StatelessWidget {
  const PostsPage({
    Key key,
    @required this.service,
  }) : super(key: key);

  final PostsService service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TITLE),
      ),
      body: Center(
        child: PostsList(service: service),
      ),
    );
  }
}

class PostsList extends StatelessWidget {
  const PostsList({
    Key key,
    @required this.service,
  }) : super(key: key);

  final PostsService service;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: service.getPosts(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: snapshot.data.map((post) => PostTile(post: post,)).toList(),
          );
        }

        if (snapshot.hasError) {
          return const Text('An error has occured');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return const Text('No posts to show');
      },
    );
  }
}

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({
    Key key,
    @required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.message),
      title: Text(post.title),
      subtitle: Text('${post.id}'),
    );
  }
}

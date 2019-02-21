import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'post.jser.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  @override
  String toString() => '$userId | $id | $title | $body';
}

@GenSerializer()
class PostJsonSerializer extends Serializer<Post> with _$PostJsonSerializer {}

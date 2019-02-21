// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PostJsonSerializer implements Serializer<Post> {
  @override
  Map<String, dynamic> toMap(Post model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'userId', model.userId);
    setMapValue(ret, 'id', model.id);
    setMapValue(ret, 'title', model.title);
    setMapValue(ret, 'body', model.body);
    return ret;
  }

  @override
  Post fromMap(Map map) {
    if (map == null) return null;
    final obj = new Post(
        userId: map['userId'] as int ?? getJserDefault('userId'),
        id: map['id'] as int ?? getJserDefault('id'),
        title: map['title'] as String ?? getJserDefault('title'),
        body: map['body'] as String ?? getJserDefault('body'));
    return obj;
  }
}

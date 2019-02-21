import 'package:flutter/material.dart';
import 'package:posts_loading/posts_app.dart';
import 'package:posts_loading/posts_service.dart';

void main() {
  final PostsService service = PostsService();
  
  runApp(PostsApp(service: service));
}

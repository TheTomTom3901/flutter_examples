import 'package:http/http.dart';
import 'package:jaguar_client/jaguar_client.dart' show JsonClient;
import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:posts_loading/model/post.dart';

class PostsService {
  final JsonClient client = JsonClient(IOClient(), repo: JsonRepo(serializers: [PostJsonSerializer()]));
  
  Future<List<Post>> getPosts() {
    return client.get('https://jsonplaceholder.typicode.com/posts').decodeList<Post>();
  }
}
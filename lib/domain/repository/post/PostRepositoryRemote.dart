import 'package:DemoFlutter/data/entities/Post.dart';

abstract class PostRepositoryRemote {
  
  Future<List<Post>> getPosts();
}
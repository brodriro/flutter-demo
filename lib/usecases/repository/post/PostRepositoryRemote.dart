import 'package:base_flutter/entities/Post.dart';

abstract class PostRepositoryRemote {
  
  Future<List<Post>> getPosts();
}
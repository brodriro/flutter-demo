import 'package:base_flutter/data/entities/Post.dart';

abstract class PostRepositoryRemote {
  
  Future<List<Post>> getPosts();
}
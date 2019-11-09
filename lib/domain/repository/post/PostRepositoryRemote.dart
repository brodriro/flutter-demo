import 'package:DemoFlutter/domain/entities/Post.dart';

abstract class PostRepositoryRemote {
  
  Future<List<Post>> getPosts();
}
import 'package:base_flutter/domain/repository/post/PostRepositoryRemote.dart';
import 'package:base_flutter/data/entities/Post.dart';

class PostUseCase {
  PostRepositoryRemote postRepositoryRemote;

  PostUseCase(this.postRepositoryRemote);


  Future<List<Post>> getPosts() async {
    return await this.postRepositoryRemote.getPosts();
  }

  
}

import 'package:DemoFlutter/domain/repository/post/PostRepositoryRemote.dart';
import 'package:DemoFlutter/data/entities/Post.dart';

class PostUseCase {
  PostRepositoryRemote postRepositoryRemote;

  PostUseCase(this.postRepositoryRemote);


  Future<List<Post>> getPosts() async {
    return await this.postRepositoryRemote.getPosts();
  }

  
}

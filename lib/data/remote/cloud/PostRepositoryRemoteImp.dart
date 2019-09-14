import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/data/remote/entities/PostEntity.dart';
import 'package:DemoFlutter/data/remote/network/ApiURL.dart';
import 'package:DemoFlutter/domain/repository/post/PostRepositoryRemote.dart';
import 'package:http/http.dart';

class PostRepositoryRemoteImp implements PostRepositoryRemote {
  Client _client;

  PostRepositoryRemoteImp(this._client);
  
  @override
  Future<List<Post>> getPosts() async {
    String url = ApiURL.posts;
    List<PostEntity> listPostEntity;

    final response = await _client.get(url); 
    listPostEntity = postEntityFromJson(response.body);
   
    return PostEntity.toPosts(listPostEntity);
  }
}

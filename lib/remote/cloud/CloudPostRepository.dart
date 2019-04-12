import 'package:base_flutter/entities/Post.dart';
import 'package:base_flutter/remote/entities/PostEntity.dart';
import 'package:base_flutter/remote/network/ApiURL.dart';
import 'package:base_flutter/usecases/repository/post/PostRepositoryRemote.dart';
import 'package:http/http.dart';

class CloudPostRepository implements PostRepositoryRemote {
  Client _client;

  CloudPostRepository(this._client);
  
  @override
  Future<List<Post>> getPosts() async {
    String url = ApiURL.posts;
    List<PostEntity> listPostEntity;

    final response = await _client.get(url); 
    listPostEntity = postEntityFromJson(response.body);
   
    return PostEntity.toPosts(listPostEntity);
  }
}

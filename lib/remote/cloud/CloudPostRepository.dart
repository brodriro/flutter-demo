import 'package:base_flutter/entities/Post.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/remote/entities/PostEntity.dart';
import 'package:base_flutter/remote/network/ApiURL.dart';
import 'package:base_flutter/usecases/repository/post/PostRepositoryRemote.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CloudPostRepository implements PostRepositoryRemote {
  Client _client;

  CloudPostRepository(this._client);
  
  @override
  Future<List<Post>> getPosts() async {
    debugPrint("Fetching Post from CloudPostRepository");
    String url = ApiURL.posts;
    List<PostEntity> listPostEntity;

    final response = await _client.get(url);
    debugPrint("Response  status : ${response.statusCode}");
    debugPrint("Response  body : ${response.body}");
    listPostEntity = postEntityFromJson(response.body);

    return PostEntity.toPosts(listPostEntity);
  }
}

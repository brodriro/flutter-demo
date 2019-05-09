import 'package:base_flutter/entities/Post.dart';
import 'package:base_flutter/presentation/views/components/RoundedImage.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailScreen.dart';
import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  Post post;

  PostComponent(this.post);

  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return cardPost();
  }

  Widget cardPost() {
    return Card(
      margin: EdgeInsets.only(top: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          headerCard(post.getUserImage, post.getUserName),
          bodyCard(post.getImage, post.getBody),
          separator(),
          footerCard(post.getLikes.toString()),
        ],
      ),
    );
  }

  Widget headerCard(String image, String username) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          RoundedImageComponent(network: image),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              (username == null) ? "" : username,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyCard(String image, String textPost) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(textPost),
          ),
        ],
      ),
    );
  }

  Widget footerCard(String likes) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.blueAccent,
          ),
          Container(
            margin: EdgeInsets.only(left: 5, right: 15),
            child: Text(
              likes,
              style: TextStyle(
                  color: Colors.blueAccent, fontWeight: FontWeight.w700),
            ),
          ),
          RaisedButton(
            onPressed: () => onClickComment(this.context),
            color: Colors.grey[100],
            disabledColor: Colors.transparent,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.add_comment,
                  color: Colors.blueAccent,
                ),
                Text(
                  "Comment",
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                )
              ],
            ),
            padding: EdgeInsets.all(5),
          ),
        ],
      ),
    );
  }

  Widget separator() {
    return Container(
      height: 1,
      color: Colors.black26,
    );
  }

  void onClickComment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedDetailScreen(post: post),
      ),
    );
  }
}

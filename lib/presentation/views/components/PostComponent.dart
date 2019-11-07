import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:DemoFlutter/presentation/views/components/RoundedImage.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/FeedDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostComponent extends StatelessWidget {
  BuildContext context;
  Post post;

  PostComponent({@required this.post});

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
      height: 192,
      child: Stack(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 192,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.maxFinite,
                  color: ThemeColor.colorText.withOpacity(0.65),
                  padding: EdgeInsets.all(8),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    //mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(textPost, style: TextStyle(color: ThemeColor.whiteColor),),
                    ],
                  )))
        ],
      ),
    );
  }

  Widget footerCard(String likes) {
    return Container(
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(CupertinoIcons.heart_solid,
                      color: ThemeColor.colorAccent),
                ),
                Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Text(
                    likes,
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => onClickComment(this.context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.comment,
                    color: Colors.blueAccent,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                  ),
                  Text(
                    "Comment",
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  )
                ],
              ),
            ),
          )
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

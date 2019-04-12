import 'package:base_flutter/entities/Post.dart';
import 'package:base_flutter/presentation/di/Injector.dart';
import 'package:base_flutter/presentation/views/components/cComment.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailPresenter.dart';
import 'package:base_flutter/presentation/views/feedDetail/FeedDetailView.dart';
import 'package:flutter/material.dart';

class FeedDetailScreen extends StatefulWidget {
  final Post post;
  FeedDetailPresenter feedDetailPresenter;

  FeedDetailScreen({Key key, @required this.post}) : super(key: key) {
    this.feedDetailPresenter = Injector.inject().resolve<FeedDetailPresenter>();
  }

  @override
  _FeedDetailScreenState createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> implements FeedDetailView {
  List<Comment> commentList;

  final inputMessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    commentList = (widget.post.getComments == null)
        ? new List<Comment>()
        : widget.post.getComments;

    return new Scaffold(
      backgroundColor: Colors.blue,
      body: body(),
    );
  }

  Widget body() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        width: double.maxFinite,
        margin: EdgeInsets.only(left: 6, right: 6, top: 32),
        padding: EdgeInsets.all(6),
        child: Stack(
          children: <Widget>[
            showComments(),
            showTextBox(),
          ],
        ));
  }

  Widget showTextBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.topCenter,
        height: 56,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: inputMessageController,
                decoration: InputDecoration(hintText: "Escribir comentario."),
                autofocus: false,
                maxLines: 2,
                autocorrect: true,
              ),
            ),
            Container(
              child: IconButton(
                icon: Icon(Icons.send),
                color: Colors.grey[600],
                onPressed: onSendInputMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showComments() {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          showList(),
        ],
      ),
    );
  }

  Widget showList() {
    if (commentList.length == 0) return Container();

    return Container(
      child: Expanded(
        child: new ListView.builder(
          itemCount: commentList.length,
          padding: const EdgeInsets.all(4),
          itemBuilder: (BuildContext _context, int i) {
            return rowList(commentList[i]);
          },
        ),
      ),
    );
  }

  Widget rowList(Comment comment) {
    return CommentComponent(
      comment.getComment,
      networkImage: comment.getUserImage,
      onClickImage: () {},
    );
  }

  void onSendInputMessage() {
    debugPrint("onSendMessage => ${inputMessageController.text}");
  }

@override
  void initState() {
    this.widget.feedDetailPresenter.start(this);
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    inputMessageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void updateList(Comment comment) {
    // TODO: implement updateList
  }

  @override
  void onSendMessage(String message) {
    // TODO: implement onSendMessage
  }
}
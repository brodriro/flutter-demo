import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/presentation/di/Injector.dart';
import 'package:DemoFlutter/presentation/views/components/cComment.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/FeedDetailPresenter.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/FeedDetailView.dart';
import 'package:flutter/material.dart';

class FeedDetailScreen extends StatefulWidget {
  final Post post;
  

  FeedDetailScreen({ @required this.post});

  @override
  _FeedDetailScreenState createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> implements FeedDetailView{
  FeedDetailPresenter feedDetailPresenter = Injector.inject().resolve<FeedDetailPresenter>();
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
    this.feedDetailPresenter.onInputSendMessage(inputMessageController.text.toString());
    this.inputMessageController.clear();
  }

  @override
  void initState() {
    super.initState();
    this.feedDetailPresenter.start(this);
  }

  @override
  void dispose() {
    inputMessageController.dispose();
    super.dispose();
  }

  @override
  void addComment(Comment comment) {
    setState(() {
     this.commentList.add(comment); 
    });
  }
}

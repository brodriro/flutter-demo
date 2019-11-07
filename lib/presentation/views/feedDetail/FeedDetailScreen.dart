import 'package:DemoFlutter/data/entities/Post.dart';
import 'package:DemoFlutter/presentation/views/components/cComment.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/bloc/FeedDetailBloc.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/bloc/FeedDetailEvent.dart';
import 'package:DemoFlutter/presentation/views/feedDetail/bloc/FeedDetailState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedDetailScreen extends StatefulWidget {
  final Post post;

  FeedDetailScreen({@required this.post});

  @override
  _FeedDetailScreenState createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  List<Comment> commentList = new List<Comment>();
  FeedDetailBloc bloc;
  final inputMessageController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.post.getComments != null) commentList = widget.post.getComments;

    return new Scaffold(
      backgroundColor: Colors.blue,
      body: BlocProvider<FeedDetailBloc>(
          builder: (context) {
            bloc = FeedDetailBloc();
            return bloc;
          },
          child: BlocListener<FeedDetailBloc, FeedDetailState>(
            listener: (context, state) {
              if (state is AddComment) {
                this.commentList.add(state.comment);
              }
            },
            child: BlocBuilder<FeedDetailBloc, FeedDetailState>(
              builder: (context, state) {
                return body();
              },
            ),
          )),
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
    bloc.add(InputSendMessage(comment: inputMessageController.text.toString()));
    inputMessageController.clear();
  }

  @override
  void dispose() {
    inputMessageController.dispose();
    super.dispose();
  }
}

import 'package:base_flutter/presentation/views/components/RoundedImage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentComponent extends StatelessWidget {
  String networkImage;
  String comment;
  VoidCallback onClickImage;

  CommentComponent(this.comment, {this.networkImage, this.onClickImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2, bottom: 4),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: GestureDetector(
              onTap: onClickImage,
              child: RoundedImageComponent(
                network: networkImage,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 10, right: 5),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey[200],
              ),
              child: Text(comment),
            ),
          ),
        ],
      ),
    );
  }
}

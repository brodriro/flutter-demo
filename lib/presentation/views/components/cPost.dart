import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return cardPost();
  }

  Widget cardPost() {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          headerCard(null, "Demian Dark"),
          bodyCard('assets/images/default_post_image.jpg',
              "A card is a sheet of Material used to represent some related information, for example an album, a geographical location, a meal, contact details, etc."),
          separator(),
          footerCard("15"),
        ],
      ),
    );
  }

  Widget headerCard(String image, String username) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: (image == null)
                      ? AssetImage("assets/images/avatar_default.jpg")
                      : NetworkImage(image),
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 2.0,
                      offset: Offset(0.0, 3.0))
                ]),
          ),
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
          Image(
            image: AssetImage(image),
            height: 150,
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
}

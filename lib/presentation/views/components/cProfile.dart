import 'package:base_flutter/entities/User.dart';
import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  final User _user;
  ProfileComponent(this._user);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_header(), _body()],
    );
  }

  Widget _body() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          _textTitle("Name"),
          _textDescription(
              (_user == null) ? "" : "${_user.getName} ${_user.getLastName}"),
          _textTitle("Age"),
          _textDescription((_user == null) ? "" : "${_user.getAge} years"),
          _textTitle("Email"),
          _textDescription((_user == null) ? "" : _user.getEmail),
          _textTitle("Location"),
          _textDescription((_user == null) ? "" : _user.getLocation),
          _textTitle("Occupation"),
          _textDescription((_user == null) ? "" : _user.getOccupation),
        ],
      ),
    );
  }

  Widget _header() {
    Social social = (_user != null) ? _user.getSocial : null;
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: Card(
        elevation: 2,
        margin: EdgeInsets.all(0),
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(90),
          topLeft: Radius.circular(90),
        )),
        child: Container(
          height: 140,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: (_user == null)
                              ? AssetImage("assets/images/avatar_default.jpg")
                              : NetworkImage(_user.getImage),
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 15.0,
                              offset: Offset(0.0, 6.0))
                        ]),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Column(children: <Widget>[
                          _textTitle("Likes", white: true),
                          _textDescription(
                              (social != null) ? "${social.getLikes}" : "0",
                              white: true),
                          _textTitle("Shares", white: true),
                          _textDescription(
                              (social != null) ? "${social.getLikes}" : "0",
                              white: true),
                        ])),
                        Expanded(
                            child: Column(children: <Widget>[
                          _textTitle("Posts", white: true),
                          _textDescription(
                              (social != null) ? "${social.getPost}" : "0",
                              white: true),
                          _textTitle("Friends", white: true),
                          _textDescription(
                              (social != null) ? "${social.getFriends}" : "0",
                              white: true),
                        ])),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textTitle(String title, {bool white}) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(bottom: 2, top: 15),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: (white != null) ? Colors.white : Colors.black54,
          ),
        ));
  }

  Widget _textDescription(String title, {bool white}) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 16,
              color: (white != null) ? Colors.white : Colors.black54),
        ));
  }
}

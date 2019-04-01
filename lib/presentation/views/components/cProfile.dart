import 'package:base_flutter/entities/User.dart';
import 'package:flutter/material.dart';

class ProfileComponent extends StatelessWidget {
  final User _user;
  ProfileComponent(this._user);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[_header(), _body()],
    );
  }

  Widget _body() {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _textTitle("Name"),
          _textDescription((_user == null) ? "" : _user.getName),
          _textTitle("LastName"),
          _textDescription((_user == null) ? "" : _user.getLastName),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 200,
      color: Colors.blueAccent,
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: (_user.getImage == null)
                          ? null
                          : NetworkImage(_user.getImage)),
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 7.0))
                  ]),
            ),
          )),
          Expanded(
            child: Row(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }

  Widget _textDescription(String title) {
    return Text(
      title,
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 16),
    );
  }
}

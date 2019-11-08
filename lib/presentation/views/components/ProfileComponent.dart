import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileComponent extends StatefulWidget {
  final User _user;

  ProfileComponent(this._user);

  @override
  _ProfileComponentState createState() => _ProfileComponentState();
}

class _ProfileComponentState extends State<ProfileComponent>
    with TickerProviderStateMixin {
  Social social;

  AnimationController controller;

  CurvedAnimation animation;

  @override
  Widget build(BuildContext context) {
    social = (widget._user != null) ? widget._user.getSocial : null;
    return Container(
      child: Stack(
        children: <Widget>[header(), cardProfile(), newBody()],
      ),
    );
  }

  Widget newBody() {
    return Container(
      margin: EdgeInsets.only(top: 330),
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          rowInfoProfile(Icons.person, "Age", widget._user.getAge,
              animationDuration: 500),
          rowInfoProfile(Icons.mail, "Email", widget._user.getEmail,
              animationDuration: 600),
          rowInfoProfile(Icons.work, "Occupation", widget._user.getOccupation,
              animationDuration: 700),
          rowInfoProfile(
              Icons.phone_android, "Phone", widget._user.getPhoneNumber,
              animationDuration: 800)
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      height: 220,
      color: ThemeColor.primaryColor,
      child: Container(),
    );
  }

  Widget cardProfile() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 24, right: 24),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: ThemeColor.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          offset: Offset(0.0, 1.0))
                    ]),
                margin: EdgeInsets.only(top: 50),
                padding:
                    EdgeInsets.only(top: 64, left: 16, right: 16, bottom: 24),
                child: Column(
                  children: <Widget>[
                    _textTitle(
                        "${widget._user.getName} ${widget._user.getLastName}",
                        alignment: Alignment.center),
                    Container(
                      margin: EdgeInsets.only(top: 4, bottom: 42),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.location_on,
                              color: ThemeColor.colorAccent, size: 14),
                          Container(width: 6),
                          _textDescription(widget._user.getLocation,
                              fontSize: 14, color: ThemeColor.colorAccent)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        socialColumn(title: "LIKES", count: social.getLikes),
                        socialColumn(title: "SHARES", count: social.getShares),
                        socialColumn(title: "POSTS", count: social.getPost),
                        socialColumn(title: "FRIENDS", count: social.getFriends)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: (widget._user.getImage == null)
                        ? AssetImage("assets/images/avatar_default.jpg")
                        : NetworkImage(widget._user.getImage),
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: 8.0,
                        offset: Offset(0.0, 6.0))
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textTitle(String title,
      {Alignment alignment, double fontSize, Color color}) {
    if (alignment == null) alignment = Alignment.centerLeft;
    if (fontSize == null) fontSize = 18;
    if (color == null) color = ThemeColor.colorText;
    return Container(
        alignment: alignment,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ));
  }

  Widget _textDescription(String title,
      {Alignment alignment, double fontSize, Color color}) {
    if (alignment == null) alignment = Alignment.centerLeft;
    if (fontSize == null) fontSize = 16;
    if (color == null) color = ThemeColor.colorText;

    return Container(
        alignment: alignment,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: fontSize, color: color),
        ));
  }

  Widget socialColumn({String title, int count}) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          _textTitle(title,
              fontSize: 14,
              alignment: Alignment.center,
              color: ThemeColor.colorText.withOpacity(0.8)),
          _textDescription(count.toString(),
              fontSize: 18, alignment: Alignment.center)
        ],
      ),
    );
  }

  Widget rowInfoProfile(IconData icon, String title, String content,
      {@required int animationDuration}) {
    controller = AnimationController(
        duration: Duration(milliseconds: animationDuration), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();

    return FadeTransition(
      opacity: animation,
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: ThemeColor.colorAccent, size: 24),
                Padding(padding: EdgeInsets.only(left: 12)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _textDescription(title,
                        fontSize: 20, color: ThemeColor.colorAccent),
                    _textDescription(content, fontSize: 20)
                  ],
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 1,
                color: ThemeColor.backgroundRow),
          ],
        ),
      ),
    );
  }
}

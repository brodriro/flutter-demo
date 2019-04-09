import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          headerCard(null, "Demian Dark"),
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
            width: 48,
            height: 48,
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
                      blurRadius: 15.0,
                      offset: Offset(0.0, 6.0))
                ]),
          ),
          Text((username == null) ? "":username )
        ],
      ),
    );
  }
}

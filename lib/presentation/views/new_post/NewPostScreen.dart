import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColor.newPostBackground,
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.62,
            color: ThemeColor.whiteColor,
            child: Container(
                // AQUI VA LA FOTO O  EL ICONO PARA TOMAR FOTO
                ),
          ),
          Card(
            margin: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 32),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            elevation: 2,
            child: Container(
              width: double.maxFinite,
                padding: EdgeInsets.all(10),
                child: Text("Description")),
            /*   EditableText(

                  )*/
          ),
          Container(
            margin: EdgeInsets.only(bottom: 16),
            height: 48,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Hero(
              tag: HeroTagConstants.feedFloatingButton,
              child: RaisedButton(
                child: Text(
                  "Create post",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(24.0),
                ),
                textColor: ThemeColor.whiteColor,
                onPressed: _createNewPost,
                color: ThemeColor.colorAccent,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _createNewPost() async {}
}

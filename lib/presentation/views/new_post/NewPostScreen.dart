import 'dart:io';

import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class NewPostScreen extends StatefulWidget {
  NewPostScreen();

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  TextEditingController _descriptionTextController;

  @override
  void initState() {
    _descriptionTextController = TextEditingController();
    super.initState();
  }

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      color: ThemeColor.newPostBackground,
      child: Row(

        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.62,
            color: ThemeColor.whiteColor,
            child: _image == null
                ? RaisedButton(
                    onPressed: getImage,
                    child: Center(
                      child: Icon(FontAwesomeIcons.camera),
                    ),
                  )
                : Image.file(
                    _image,
                    height: 200,
                  ),
          ),
          Card(
            margin: EdgeInsets.only(left: 16, right: 16, top: MediaQuery.of(context).size.height * 0.62, bottom: 32),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            elevation: 2,
            child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Description",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.colorText)),
                    TextField(
                      controller: _descriptionTextController,
                      style: TextStyle(
                          color: ThemeColor.colorText,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )),
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

  @override
  void dispose() {
    _descriptionTextController?.dispose();
    super.dispose();
  }
}

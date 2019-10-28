import 'package:DemoFlutter/data/entities/User.dart';
import 'package:DemoFlutter/presentation/views/components/RoundedImage.dart';
import 'package:DemoFlutter/presentation/views/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowUserProfile extends StatelessWidget {
  User _user;
  VoidCallback onClickRow;

  RowUserProfile(this._user, {this.onClickRow});

  @override
  Widget build(BuildContext context) {
    String title = (this._user == null)
        ? "Full name"
        : "${this._user.getName} ${this._user.getLastName}";

    String age =
        (this._user == null) ? "0 years" : "${this._user.getAge} years";
    String username =
        (this._user == null) ? "Username" : this._user.getUsername;

    String subtitle = "$username - $age";
    String image = (this._user == null) ? null : this._user.getImage;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ThemeColor.backgroundRow,
      ),
      child: GestureDetector(
        onTap: onClickRow,
        child: Row(
          children: <Widget>[
            Container(
              child: RoundedImageComponent(
                size: 48,
                network: image,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: ThemeColor.colorText,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(color: ThemeColor.colorText, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

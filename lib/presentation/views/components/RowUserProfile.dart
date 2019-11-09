import 'package:DemoFlutter/domain/entities/User.dart';
import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:DemoFlutter/presentation/views/components/RoundedImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowUserProfile extends StatelessWidget {
  User _user;
  VoidCallback onClickRow;

  RowUserProfile(this._user, {this.onClickRow});

  @override
  Widget build(BuildContext context) {
    String title = "${this._user.getName} ${this._user.getLastName}";
    String age = "${this._user.getAge} years";
    String username = this._user.getUsername;

    String subtitle = "$username - $age";
    String image = (this._user.getImage.isEmpty) ? null : this._user.getImage;

    return Container(
      margin: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onClickRow,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[

            Container(
              height: 64,
              width: double.maxFinite,
              padding:
                  EdgeInsets.only(left: 36, right: 12, top: 12, bottom: 12),
              margin: EdgeInsets.only(left: 36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ThemeColor.backgroundRow,
              ),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                direction: Axis.vertical,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          color: ThemeColor.colorText,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text(
                    subtitle,
                    style: TextStyle(color: ThemeColor.colorText, fontSize: 14),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: RoundedImageComponent(
                  size: 64,
                  network: image,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundedImageComponent extends StatelessWidget {
  String assets;
  String network;
  double size;
  BoxShadow boxShadow;

  RoundedImageComponent({this.network, this.size, this.assets, this.boxShadow});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(2),
      width: (size == null) ? 38 : size,
      height: (size == null) ? 38 : size,
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: (network == null)
                ? AssetImage((assets == null)
                    ? "assets/images/avatar_default.jpg"
                    : assets)
                : NetworkImage(network),
          ),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1),
          boxShadow: <BoxShadow>[
            (boxShadow != null)
                ? boxShadow
                : BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.7,
                    offset: Offset(0.0, 3.0))
          ]),
    );
  }
}

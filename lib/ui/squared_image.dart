import 'package:flutter/material.dart';

class SquaredImageShadow extends StatelessWidget {
  final String backgroundImage;
  final double radius;
  final Color backgroundColor;

  const SquaredImageShadow(
      {Key key, this.backgroundImage, this.radius, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      new Container(
        width: this.radius*2,
        height: this.radius*2,
        decoration: new BoxDecoration(
          // Circle shape
            shape: BoxShape.circle,
            color: backgroundColor,
            // The border you want
            border: new Border.all(
              width: 2.0,
              color: Colors.white,
            ),
            // The shadow you want
            boxShadow: [
              new BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5.0,
              ),
            ]
        ),



        child:  Image.network(this.backgroundImage),



      );
  }
}

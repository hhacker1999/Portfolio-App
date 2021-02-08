import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  final String text;
  final String media;
  Page1({this.text, this.media});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30.0,
            ),
          ),
        ),
        Image.asset(
          media,
        ),
      ],
    );
  }
}

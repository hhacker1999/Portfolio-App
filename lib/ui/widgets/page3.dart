import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Page3 extends StatelessWidget {
  final String text;
  final String media;
  Page3({this.text, this.media});

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
            )),
        InkWell(
          onTap: () {},
          child: Container(
            width: 160.0,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 30.0,
                  color: Colors.black45,
                  offset: Offset(5, 20.0),
                ),
              ],
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  height: 50.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22.0),
                      topLeft: Radius.circular(22.0),
                      bottomRight: Radius.circular(200.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Click Here',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0),
                    ),
                  ),
                ),
                Icon(
                  Icons.move_to_inbox,
                  size: 30.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

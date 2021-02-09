import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:setup_app/ui/views/homeview/homeview_model.dart';
import 'package:stacked/stacked.dart';

class Page2 extends ViewModelWidget<HomeViewModel> {
  final String media;
  Page2({this.media});

  @override
  Widget build(BuildContext context, model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            model.title2,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 30.0,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            model.navigateToNewsView();
          },
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

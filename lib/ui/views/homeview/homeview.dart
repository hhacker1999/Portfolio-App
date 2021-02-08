import 'package:flutter/material.dart';

import 'package:setup_app/ui/views/homeview/homeview_model.dart';
import 'package:setup_app/ui/widgets/page1.dart';
import 'package:setup_app/ui/widgets/page2.dart';
import 'package:setup_app/ui/widgets/page3.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Portfolio App',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Card(
                    elevation: 50.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: PageView(
                      // pageSnapping: false,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: [
                        Page1(
                          text: model.title1,
                          media: 'assets/images/19362653.jpg',
                        ),
                        Page2(
                          text: model.title2,
                        ),
                        Page3(
                          text: model.title3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

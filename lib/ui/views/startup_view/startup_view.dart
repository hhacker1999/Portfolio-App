import 'package:flutter/material.dart';
import 'package:setup_app/ui/views/startup_view/startup_view_model.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) => model.startupLogic(),
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                'Loading',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:setup_app/ui/shared/ui_helpers.dart';
import 'package:setup_app/ui/views/login_view/login_view_model.dart';
import 'package:setup_app/ui/widgets/busy_button.dart';
import 'package:setup_app/ui/widgets/input_field.dart';
import 'package:setup_app/ui/widgets/text_link.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 38,
                      ),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                InputField(
                  placeholder: 'Email',
                  controller: emailController,
                ),
                verticalSpaceSmall,
                InputField(
                  placeholder: 'Password',
                  password: true,
                  controller: passwordController,
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BusyButton(
                      busy: true,
                      title: 'Login',
                      onPressed: () {
                        model.logIN(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                    )
                  ],
                ),
                verticalSpaceMedium,
                TextLink(
                  'Create an Account if you\'re new.',
                  onPressed: () {
                    model.navigate();
                  },
                )
              ],
            ),
          )),
    );
  }
}

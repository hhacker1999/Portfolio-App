import 'package:auto_route/auto_route_annotations.dart';
import 'package:setup_app/ui/views/homeview/homeview.dart';
import 'package:setup_app/ui/views/login_view/login_view.dart';
import 'package:setup_app/ui/views/sign_up_view/signup_view.dart';
import 'package:setup_app/ui/views/startup_view/startup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(
      page: SignUpView,
    ),
    MaterialRoute(
      page: LoginView,
    ),
    MaterialRoute(
      page: StartUpView,
    ),
  ],
)
class $Router {}

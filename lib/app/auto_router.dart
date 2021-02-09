import 'package:auto_route/auto_route_annotations.dart';
import 'package:setup_app/ui/views/chat_view/chat_view.dart';
import 'package:setup_app/ui/views/homeview/homeview.dart';
import 'package:setup_app/ui/views/login_view/login_view.dart';
import 'package:setup_app/ui/views/news_view/news_view.dart';
import 'package:setup_app/ui/views/sign_up_view/signup_view.dart';
import 'package:setup_app/ui/views/startup_view/startup_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(
      page: SignUpView,
    ),
    MaterialRoute(
      page: LoginView,
    ),
    MaterialRoute(
      page: HomeView,
    ),
    MaterialRoute(
      page: NewsView,
    ),
    MaterialRoute(
      page: ChatView,
    ),
  ],
)
class $Router {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/chat_view/chat_view.dart';
import '../ui/views/homeview/homeview.dart';
import '../ui/views/login_view/login_view.dart';
import '../ui/views/news_view/news_view.dart';
import '../ui/views/sign_up_view/signup_view.dart';
import '../ui/views/startup_view/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String signUpView = '/sign-up-view';
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String newsView = '/news-view';
  static const String chatView = '/chat-view';
  static const all = <String>{
    startUpView,
    signUpView,
    loginView,
    homeView,
    newsView,
    chatView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.newsView, page: NewsView),
    RouteDef(Routes.chatView, page: ChatView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    NewsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewsView(),
        settings: data,
      );
    },
    ChatView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChatView(),
        settings: data,
      );
    },
  };
}

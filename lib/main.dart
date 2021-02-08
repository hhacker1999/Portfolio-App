import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:setup_app/app/auto_router.gr.dart' as auto_router;
import 'package:setup_app/app/locator.dart';
import 'package:setup_app/ui/views/chat_view/chat_view.dart';
import 'package:setup_app/ui/views/homeview/homeview.dart';
import 'package:setup_app/ui/views/news_view/news_view.dart';

import 'package:stacked_services/stacked_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        home: ChatView(),
        // initialRoute: auto_router.Routes.startUpView,
        onGenerateRoute: auto_router.Router().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey);
  }
}

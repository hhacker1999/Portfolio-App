import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title1 =
      'Hi, MySelf Harsh Kumar and I am an aspiring Software Engineer. You are right now Looking at my portfolio. Scroll down for more Info.';
 
  String _title2 =
      'You know a lot of times devs and interviewers ask about REST Api integration, so click the button below to a simple REST Api use with Hacker News Api.';
      String _title3 =
      'Now You have seen some REST Api its time to use firebase in our app, and we are going to use chat application as an Example';
  String get title1 => _title1;
  String get title2 => _title2;
  String get title3 => _title3;
}

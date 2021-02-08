import 'package:setup_app/app/locator.dart';
import 'package:setup_app/models/chat.dart';
import 'package:setup_app/services/auth_service.dart';
import 'package:setup_app/services/chat_service/chat_service.dart';
import 'package:stacked/stacked.dart';

class ChatViewModel extends BaseViewModel {
  final Chatservice _chatservice = locator<Chatservice>();
  final AuthService _authService = locator<AuthService>();

  String get currentUser => _authService.currentUser.email;

  Stream get populateChat => _chatservice.getChatList();

  addChat(Chat chat) {
    return _chatservice.addUser(chat);
  }
}

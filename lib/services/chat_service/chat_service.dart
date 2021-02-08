import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:setup_app/models/chat.dart';

@lazySingleton
class Chatservice {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('chats');

  Stream getChatList() {
    return _collectionReference.snapshots();
  }

  addUser(Chat chat) {
    return _collectionReference.add(chat.toJson());
  }
}

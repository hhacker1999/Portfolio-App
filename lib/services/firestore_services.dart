import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:setup_app/models/user.dart';

@lazySingleton
class FirestoreService {
  final CollectionReference _userscollectionReference =
      FirebaseFirestore.instance.collection('users');

  Future createUser(AppUser user) async {
    try {
      await _userscollectionReference.doc(user.id).set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _userscollectionReference.doc(uid).get();
      return AppUser.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }
}

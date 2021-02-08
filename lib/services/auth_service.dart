import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:setup_app/app/locator.dart';
import 'package:setup_app/models/user.dart';
import 'package:setup_app/services/firestore_services.dart';

@lazySingleton
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  AppUser _currentUser = AppUser();
  AppUser get currentUser => _currentUser;
  Future signInwithEMAILandPassword(
    // ignore: invalid_required_positional_param
    @required String email,
    // ignore: invalid_required_positional_param
    @required String password,
  ) async {
    try {
      var authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      await _populateCurrentUser(authResult.user);
      return authResult != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signIUpwithEMAILandPassword(
    // ignore: invalid_required_positional_param
    @required String email,
    // ignore: invalid_required_positional_param
    @required String password,
    // ignore: invalid_required_positional_param
    @required String name,
  ) async {
    try {
      var authresult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // create user profile in firestore
      _currentUser = AppUser(
        id: authresult.user.uid,
        name: name,
        email: email,
      );
      await _firestoreService.createUser(_currentUser);
      return authresult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    // ignore: await_only_futures
    var user = await _auth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    } else {}
  }
}

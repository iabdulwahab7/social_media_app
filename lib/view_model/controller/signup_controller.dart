import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gs_social/utils/utils.dart';

class SignUpController with ChangeNotifier {
  bool _loading = false;

  final auth = FirebaseAuth.instance;

  bool get loading => _loading;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  void signUp(String userName, String email, String password) async {
    try {} catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}

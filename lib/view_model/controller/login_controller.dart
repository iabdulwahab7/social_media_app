import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gs_social/utils/route/route_name.dart';
import 'package:gs_social/utils/utils.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';

class LoginController with ChangeNotifier {
  final auth = FirebaseAuth.instance;
  bool _loading = false;
  bool get loading => _loading;

  setLoading(value) {
    value = _loading;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.dashboardView);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toastMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}

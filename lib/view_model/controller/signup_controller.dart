import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gs_social/utils/route/route_name.dart';
import 'package:gs_social/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';

class SignUpController with ChangeNotifier {
  bool _loading = false;

  final auth = FirebaseAuth.instance;

  final ref = FirebaseDatabase.instance.ref().child('Users');

  bool get loading => _loading;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  void signUp(BuildContext context, String username, String email,
      String password) async {
    setLoading(true);

    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        SessionController().userId = value.user!.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'username': username,
          'onlineStatus': 'None',
          'phone': '',
          'profile': '',
        }).then((value) {
          setLoading(false);
          Utils.toastMessage("Registration Successful");
          Navigator.pushReplacementNamed(context, RoutesName.dashboardView);
        }).onError((error, stackTrace) {
          setLoading(false);
        });
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

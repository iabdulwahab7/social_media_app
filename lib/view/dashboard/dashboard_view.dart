import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gs_social/utils/route/route_name.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(SessionController().userId.toString()),
        actions: [
          IconButton(
              onPressed: () {
                final auth = FirebaseAuth.instance;
                auth.signOut().then((value) {
                  SessionController().userId = '';
                  Navigator.pushReplacementNamed(context, RoutesName.loginView);
                });
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }
}

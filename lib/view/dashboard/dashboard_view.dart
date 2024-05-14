import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/utils/route/route_name.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
        title: const Text("Welcome"),
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
      body: PersistentTabView(
        context,
        screens: _buildViews(),
        items: _buildNavBarItems(),
        backgroundColor: AppColors.otpHintColor,
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }

  List<Widget> _buildViews() {
    return [
      const Text("Home"),
      const Text("Chat"),
      const Text("Add"),
      const Text("UserList"),
      const Text("Profile"),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.blackColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(
          Icons.home,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.blackColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(Icons.chat),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.blackColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(Icons.add),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.blackColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(Icons.list),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.blackColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(Icons.person_2_outlined),
      ),
    ];
  }
}

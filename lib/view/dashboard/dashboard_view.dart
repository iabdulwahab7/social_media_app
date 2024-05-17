import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/view/dashboard/profile/profile_view.dart';
import 'package:gs_social/view/dashboard/users/user_list_view.dart';
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
      body: PersistentTabView(
        context,
        screens: _buildViews(),
        items: _buildNavBarItems(),
        backgroundColor: AppColors.otpHintColor,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        confineInSafeArea: true,
        hideNavigationBarWhenKeyboardShows: true,
      ),
    );
  }

  List<Widget> _buildViews() {
    return [
      const SafeArea(child: Text("Home")),
      const SafeArea(child: Text("Chat")),
      const SafeArea(child: UserListView()),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryIconColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(
          Icons.home,
        ),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryIconColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(Icons.chat),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryIconColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(Icons.list),
      ),
      PersistentBottomNavBarItem(
        activeColorPrimary: AppColors.primaryIconColor,
        activeColorSecondary: AppColors.whiteColor,
        inactiveColorPrimary: AppColors.textFieldDefaultBorderColor,
        icon: const Icon(Icons.person_2_outlined),
      ),
    ];
  }
}

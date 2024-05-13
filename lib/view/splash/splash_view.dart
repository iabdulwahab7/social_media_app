import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices services = SplashServices();
  @override
  void initState() {
    super.initState();
    services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: Container(
        height: height * 1,
        width: width * 1,
        color: AppColors.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  fit: BoxFit.cover,
                  height: height * 0.6,
                  image: const AssetImage('assets/images/splash.png')),
              Column(
                children: [
                  SizedBox(height: height * 0.05),
                  Text(
                    "Welcome",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: AppColors.secondaryTextColor),
                  ),
                  Text(
                    "Let's connect with us for social life!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.secondaryTextColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

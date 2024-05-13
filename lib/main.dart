import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/res/fonts.dart';
import 'package:gs_social/utils/route/route_name.dart';
import 'package:gs_social/utils/route/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: AppColors.whiteColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.whiteColor,
            centerTitle: true,
            titleTextStyle: TextStyle(
                fontSize: 22,
                fontFamily: AppFonts.sfProDisplayMedium,
                color: AppColors.primaryTextColor)),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w500,
              height: 1.6),
          headlineMedium: TextStyle(
              fontSize: 24,
              fontFamily: AppFonts.sfProDisplayMedium,
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w500,
              height: 1.9),
          headlineSmall: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.sfProDisplayBold,
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w700,
              height: 1.6),
          bodyLarge: TextStyle(
              fontSize: 16,
              fontFamily: AppFonts.sfProDisplayBold,
              color: AppColors.primaryTextColor,
              fontWeight: FontWeight.w700,
              height: 1.6),
          bodyMedium: TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.sfProDisplayRegular,
              color: AppColors.primaryTextColor,
              height: 1.6),
          bodySmall: TextStyle(
              fontSize: 12,
              fontFamily: AppFonts.sfProDisplayBold,
              color: AppColors.primaryTextColor,
              height: 2.26),
        ),
      ),
      initialRoute: RoutesName.splashView,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

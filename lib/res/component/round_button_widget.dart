// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';

class RoundButtonWidget extends StatelessWidget {
  double height;
  final String title;
  final VoidCallback onPress;
  bool loading;
  final Color backgroundColor;
  final Color textColor;

  RoundButtonWidget(
      {super.key,
      required this.onPress,
      this.loading = false,
      required this.title,
      this.height = 50,
      this.backgroundColor = AppColors.primaryButtonColor,
      this.textColor = AppColors.secondaryTextColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.whiteColor,
              ))
            : Center(
                child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: textColor, fontSize: 18, letterSpacing: 2),
              )),
      ),
    );
  }
}

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/res/component/round_button_widget.dart';
import 'package:gs_social/res/component/text_form_field_widget.dart';
import 'package:gs_social/utils/route/route_name.dart';
import 'package:gs_social/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("LOGIN",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 16,
                              color: AppColors.primaryColor.withOpacity(0.8))),
                  Text(
                    "Enter your email to connect with us!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.primaryColor.withOpacity(0.6),
                        letterSpacing: 2),
                  ),
                  SizedBox(height: height * 0.08),
                  Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormFieldWidget(
                            controller: emailController,
                            hint: "Email",
                            prefixIcon: Icons.email_outlined,
                            focusNode: emailFocusNode,
                            onFieldSubmitted: (value) {
                              Utils().focusNodeMethod(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            onValidator: (value) {
                              return value.isEmpty ? "Enter email" : null;
                            },
                          ),
                          TextFormFieldWidget(
                            controller: passwordController,
                            hint: "Password",
                            focusNode: passwordFocusNode,
                            obsecureText: true,
                            prefixIcon: Icons.lock_open_outlined,
                            onFieldSubmitted: (value) {
                              Utils().focusNodeMethod(context,
                                  passwordFocusNode, passwordFocusNode);
                            },
                            onValidator: (value) {
                              return value.isEmpty ? "Enter Password" : null;
                            },
                          ),
                        ]),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.8),
                                    letterSpacing: 2))),
                  ),
                  SizedBox(height: height * 0.02),
                  RoundButtonWidget(
                      loading: loading,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      height: height * 0.06,
                      title: "Login"),
                  SizedBox(height: height * 0.02),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.signUpView);
                    },
                    child: Text.rich(
                      TextSpan(
                          text: "Don't have an account!",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.8),
                                  letterSpacing: 2),
                          children: [
                            TextSpan(
                              text: "Signup",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.primaryColor,
                                      letterSpacing: 2),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';

import '../../res/component/round_button_widget.dart';
import '../../res/component/text_form_field_widget.dart';
import '../../utils/route/route_name.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();
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
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("SIGNUP",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 16,
                        color: AppColors.primaryColor.withOpacity(0.8))),
                Text(
                  "Register your email to connect with us!",
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
                          controller: usernameController,
                          hint: "Username",
                          prefixIcon: Icons.arrow_forward_ios_outlined,
                          focusNode: usernameFocusNode,
                          obsecureText: true,
                          onFieldSubmitted: (value) {},
                          onValidator: (value) {
                            return value.isEmpty ? "Enter Username" : null;
                          },
                        ),
                        TextFormFieldWidget(
                          controller: emailController,
                          hint: "Email",
                          prefixIcon: Icons.email_outlined,
                          focusNode: emailFocusNode,
                          onFieldSubmitted: (value) {},
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
                          onFieldSubmitted: (value) {},
                          onValidator: (value) {
                            return value.isEmpty ? "Enter Password" : null;
                          },
                        ),
                      ]),
                ),
                SizedBox(height: height * 0.03),
                RoundButtonWidget(
                    loading: loading,
                    onPress: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    height: height * 0.06,
                    title: "Signup"),
                SizedBox(height: height * 0.02),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, RoutesName.loginView);
                  },
                  child: Text.rich(
                    TextSpan(
                        text: "Already have an account!",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.primaryColor.withOpacity(0.8),
                            letterSpacing: 2),
                        children: [
                          TextSpan(
                            text: "Login",
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
      ),
    );
  }
}

// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/res/component/round_button_widget.dart';
import 'package:gs_social/res/component/text_form_field_widget.dart';
import 'package:gs_social/view_model/controller/forgot_password_controller.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    emailFocusNode.dispose();
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
                  Text(
                    "Enter your email to recover your password!",
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
                            focusNode: emailFocusNode,
                            prefixIcon: Icons.email_outlined,
                            onFieldSubmitted: (value) {},
                            onValidator: (value) {
                              return value.isEmpty ? "Enter Email" : null;
                            },
                          ),
                        ]),
                  ),
                  SizedBox(height: height * 0.02),
                  ChangeNotifierProvider(
                    create: (_) => ForgotPasswordController(),
                    child: Consumer<ForgotPasswordController>(
                        builder: (context, provider, child) {
                      return RoundButtonWidget(
                          loading: provider.loading,
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              provider.forgotPassword(
                                  context, emailController.text);
                            }
                          },
                          title: "Recover");
                    }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

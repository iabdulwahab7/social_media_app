// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/utils/utils.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';

class MessageView extends StatefulWidget {
  final String name, profile, recieverId;
  const MessageView({
    super.key,
    required this.name,
    required this.profile,
    required this.recieverId,
  });

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final databaseRef = FirebaseDatabase.instance.ref().child('Chat');
  final messageController = TextEditingController();
  final messageFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 2,
          title: Text(widget.name),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(widget.profile),
              ),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 50, bottom: 1),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.lightGrayColor.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Hi dear",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 14,
                                      ),
                                ),
                                const Icon(Icons.done_all_rounded)
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextFormField(
                      controller: messageController,
                      focusNode: messageFocusNode,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter message here",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                                color: AppColors.blackColor.withOpacity(0.5)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            width: 1,
                            color: AppColors.textFieldDefaultBorderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            width: 2,
                            color: AppColors.grayColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            width: 1,
                            color: AppColors.alertColor,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            width: 1,
                            color: AppColors.alertColor,
                          ),
                        ),
                        suffixIcon: IconButton.filled(
                            onPressed: () {
                              sendMessage();
                            },
                            icon: const Icon(
                              Icons.send_rounded,
                              color: AppColors.secondaryIconColor,
                            )),
                      ),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  sendMessage() {
    try {
      if (messageController.text.isEmpty) {
        return Utils.toastMessage("Write message");
      } else {
        final timeStamp = DateTime.now().microsecondsSinceEpoch.toString();
        databaseRef.child(timeStamp).set({
          'isSeen': false,
          'message': messageController.text.toString(),
          'sender': SessionController().userId.toString(),
          'reciever': widget.recieverId,
          'type': 'text',
          'time': timeStamp.toString(),
        }).then((value) {
          messageController.clear();
        }).onError((error, stackTrace) {
          Utils.toastMessage("onError : " + error.toString());
        });
      }
    } catch (e) {
      return Utils.toastMessage("Catch Error : " + e.toString());
    }
  }
}

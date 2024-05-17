// ignore_for_file: unnecessary_import, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/res/component/text_form_field_widget.dart';
import 'package:gs_social/utils/utils.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileController with ChangeNotifier {
  final usernameController = TextEditingController();
  final phoneController = TextEditingController();
  final usernameFocus = FocusNode();
  final phoneFocus = FocusNode();

  final databaseRef = FirebaseDatabase.instance
      .ref()
      .child('Users'); // to get instance for updating the profile pic url

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance; // to upload the image

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final picker = ImagePicker();

  XFile? _image;
  XFile? get image => _image;

  void pickImage(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 120,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      pickCameraImage(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.camera_alt_outlined),
                    title: const Text("Camera"),
                  ),
                  ListTile(
                    onTap: () {
                      pickGalleryImage(context);
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.filter_sharp),
                    title: const Text("Gallery"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future pickGalleryImage(BuildContext context) async {
    try {
      final pickedFile = await picker.pickImage(
          source: ImageSource.gallery, imageQuality: 100);

      if (pickedFile != null) {
        uploadImage();
        _image = XFile(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  Future pickCameraImage(BuildContext context) async {
    try {
      final pickedFile =
          await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

      if (pickedFile != null) {
        uploadImage();
        _image = XFile(pickedFile.path);
        notifyListeners();
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  void uploadImage() async {
    setLoading(true);
    try {
      final storageRef = firebase_storage.FirebaseStorage.instance
          .ref('/profileImage' + SessionController().userId.toString());

      final uploadTask = storageRef.putFile(File(_image!.path).absolute);
      await Future.value(uploadTask); // Wait for the upload to complete

      final newUrl = await storageRef.getDownloadURL();

      await databaseRef
          .child(SessionController().userId.toString())
          .update({'profile': newUrl.toString()});

      setLoading(false);
      Utils.toastMessage("Profile Updated");
      _image = null;
      notifyListeners();
    } catch (e) {
      setLoading(false);
      Utils.toastMessage("Error: $e"); // Display specific error message
    }
  }

  //method to update username in profile
  Future<dynamic> showDialogupdateUserName(
      BuildContext context, String username) async {
    usernameController.text = username;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update Username"),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                TextFormFieldWidget(
                    controller: usernameController,
                    hint: username,
                    focusNode: usernameFocus,
                    onFieldSubmitted: (value) {},
                    onValidator: (value) {
                      return null;
                    })
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColors.alertColor),
                )),
            TextButton(
                onPressed: () {
                  databaseRef
                      .child(SessionController().userId.toString())
                      .update({
                    'username': usernameController.text.toString()
                  }).then((value) {
                    Navigator.pop(context);
                    usernameController.clear();
                  }).onError((error, stackTrace) {
                    Utils.toastMessage(error.toString());
                  });
                },
                child: const Text("Update")),
          ],
        );
      },
    );
  }

  //method to update phonenumber in profile
  Future<dynamic> showDialogupdatePhoneNumber(
      BuildContext context, String phone) async {
    phoneController.text = phone;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Update Phone"),
          content: SizedBox(
            height: 100,
            child: Column(
              children: [
                TextFormFieldWidget(
                    controller: phoneController,
                    hint: phone,
                    focusNode: phoneFocus,
                    onFieldSubmitted: (value) {},
                    onValidator: (value) {
                      return null;
                    })
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColors.alertColor),
                )),
            TextButton(
                onPressed: () {
                  databaseRef
                      .child(SessionController().userId.toString())
                      .update({'phone': phoneController.text.toString()}).then(
                          (value) {
                    Navigator.pop(context);
                    phoneController.clear();
                  }).onError((error, stackTrace) {
                    Utils.toastMessage(error.toString());
                  });
                },
                child: const Text("Update")),
          ],
        );
      },
    );
  }
}

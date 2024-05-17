import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/view/dashboard/chat/message_view.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (context, snapshot, animation, index) {
            if (SessionController().userId.toString() ==
                snapshot.child('uid').value.toString()) {
              return const SizedBox();
            } else {
              return ListTile(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: MessageView(
                      name: snapshot.child('username').value.toString(),
                      profile: snapshot.child('profile').value.toString(),
                      recieverId: snapshot.child('uid').value.toString(),
                    ),
                    withNavBar: false,
                  );
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryIconColor),
                  ),
                  child: snapshot.child('profile').value.toString() == ""
                      ? const Icon(Icons.person_2_outlined)
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  snapshot.child('profile').value.toString())),
                        ),
                ),
                title: Text(snapshot.child('username').value.toString()),
                subtitle: Text(snapshot.child('email').value.toString()),
              );
            }
          },
        ));
  }
}

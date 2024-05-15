import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';
import 'package:gs_social/utils/utils.dart';
import 'package:gs_social/view_model/controller/session_controller.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ref = FirebaseDatabase.instance.ref('Users');
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      body: SizedBox(
        height: height * 1,
        width: width * 1,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StreamBuilder(
                  stream:
                      ref.child(SessionController().userId.toString()).onValue,
                  builder: (context, AsyncSnapshot snapshot) {
                    try {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasData) {
                        Map<dynamic, dynamic> map =
                            snapshot.data.snapshot.value;
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 13),
                                  child: Container(
                                      height: height * 0.17,
                                      width: width * 0.35,
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryIconColor,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.lightGrayColor,
                                          width: 2,
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: map['profile'].toString() == ""
                                            ? const Icon(
                                                Icons.person_outline,
                                                size: 42,
                                                color: AppColors
                                                    .secondaryIconColor,
                                              )
                                            : Image(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  map['profile'].toString(),
                                                )),
                                      )),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    radius: 16,
                                    backgroundColor: AppColors.primaryIconColor,
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.05),
                            ReusableListileWidget(
                                title: "Username",
                                value: map['username'].toString(),
                                icon: Icons.person_outline),
                            ReusableListileWidget(
                                title: "Phone",
                                value: map['phone'].toString() == ""
                                    ? '0000-0000-000'
                                    : map['phone'].toString(),
                                icon: Icons.phone_outlined),
                            ReusableListileWidget(
                                title: "Email",
                                value: map['email'].toString(),
                                icon: Icons.email_outlined),
                            const Spacer(),
                            // RoundButtonWidget(
                            //   onPress: () {
                            //     final auth = FirebaseAuth.instance;
                            //     try {
                            //       auth.signOut();
                            //       SessionController().userId = '';
                            //       Navigator.pushReplacementNamed(
                            //           context, RoutesName.loginView);
                            //     } catch (e) {
                            //       Utils.toastMessage("Error signing out: $e");
                            //     }
                            //   },
                            //   title: "Logout",
                            // ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        );
                      }
                    } catch (e) {
                      Utils.toastMessage(e.toString());
                    }
                    return const Center(child: Text("Something went wrong!"));
                  })),
        ),
      ),
    );
  }
}

class ReusableListileWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  const ReusableListileWidget(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16),
            ),
            leading: Icon(icon),
            trailing: Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 14),
            ),
          ),
          Divider(
            color: AppColors.dividedColor.withOpacity(0.3),
          )
        ],
      ),
    );
  }
}

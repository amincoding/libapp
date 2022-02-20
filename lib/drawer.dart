import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer_screens/Settings.dart';
import 'package:viplive/drawer_screens/feedback.dart';
import 'package:viplive/drawer_screens/profile.dart';
import 'package:viplive/screens/signin_email.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.teal[50],
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: <Widget>[
            Container(
              height: SizeConfig.screenHeight! * 0.13,
              child: DrawerHeader(
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile'),
              onTap: () => {Get.to(() => profileScreen())},
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Get.to(() => settingsScreen())},
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Get.to(() => feedbackScreen())},
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.4),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.to(() => signin_email());
              },
            ),
          ],
        ),
      ),
    );
  }
}

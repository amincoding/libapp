import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer_screens/Settings.dart';
import 'package:viplive/drawer_screens/feedback.dart';
import 'package:viplive/drawer_screens/profile.dart';
import 'package:viplive/screens/signin_email.dart';

import 'drawer_screens/settings_details/darkthemePreferences.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final String user = FirebaseAuth.instance.currentUser!.email!;

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 20),
          children: <Widget>[
            DrawerHeader(
              padding: const EdgeInsets.only(right: 5, bottom: 25),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight! * 0.15,
                    width: SizeConfig.screenWidth! * 0.3,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/Belbali_logo.png"),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.screenHeight! * 0.04,
                          width: SizeConfig.screenWidth! * 0.04,
                          child: Switch(
                              activeColor: Colors.white,
                              value: themeChange.darkTheme,
                              onChanged: (bool value) {
                                themeChange.darkTheme = value;
                              }),
                        ),
                        Container(
                          child: Text(themeChange.darkTheme
                              ? 'Dark mode'
                              : 'Light mode'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(child: Text(user)),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
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
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            Padding(
              padding: const EdgeInsets.only(left: 110),
              child: Row(
                children: [
                  Text("Log out"),
                  SizedBox(width: SizeConfig.screenWidth! * 0.03),
                  Container(
                    height: SizeConfig.screenHeight! * 0.06,
                    width: SizeConfig.screenWidth! * 0.06,
                    child: InkWell(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.to(() => signin_email());
                      },
                      child: Image.asset("assets/exit.png"),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

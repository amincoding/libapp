import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer_screens/Settings.dart';
import 'package:viplive/drawer_screens/about_us_screen.dart';
import 'package:viplive/drawer_screens/feedback.dart';
import 'package:viplive/drawer_screens/follow_us_screen.dart';
import 'package:viplive/drawer_screens/profile.dart';
import 'package:viplive/drawer_screens/settings_details/themeData.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/complete_information/widgets/complete_information_body.dart';
import 'package:viplive/screens/signin_email.dart';

import 'drawer_screens/settings_details/darkthemePreferences.dart';

bool completInfo = false;

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
        backgroundColor: Colors.brown[50],
        child: ListView(
          padding: EdgeInsets.only(top: 10),
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
                    width: SizeConfig.screenWidth! * 0.25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 2),
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
              onTap: () => {
                Get.to(() => completInfo == false
                    ? CompleteInformationBody()
                    : profileScreen())
              },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("about us"),
                  onPressed: () {
                    Get.to(() => aboutUsScreen());
                  },
                ),
                ElevatedButton(
                  child: Text("follow us"),
                  onPressed: () {
                    Get.to(() => followUsScreen());
                  },
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.09,
            ),
            Center(
              child: ElevatedButton.icon(
                  label: Text("Log ouT"),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Get.to(
                      () => signin_email(),
                    );
                  },
                  icon: Icon(Icons.exit_to_app)),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.03,
            ),
            Center(
              child: Container(
                child: Text(
                  "all rights are reserved to Belbali company 2022 ®",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

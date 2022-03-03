import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer_screens/Settings.dart';
import 'package:viplive/drawer_screens/about_us_screen.dart';
import 'package:viplive/drawer_screens/feedback.dart';
import 'package:viplive/drawer_screens/follow_us_screen.dart';
import 'package:viplive/drawer_screens/profile.dart';
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
        backgroundColor:
            themeChange.darkTheme ? Colors.black : Colors.teal[100],
        child: ListView(
          padding: EdgeInsets.only(top: 10),
          children: <Widget>[
            DrawerHeader(
              padding: const EdgeInsets.only(right: 5, bottom: 25),
              child: Row(
                children: [
                  Container(
                    height: SizeConfig.screenHeight! * 0.10,
                    width: SizeConfig.screenWidth! * 0.3,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/Belbali_logo.png"),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.01,
                  ),
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: SizeConfig.screenHeight! * 0.07,
                          ),
                          Text("USERNAME : ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(user),
                          Text("RULE : ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
            ),
            Container(
              color:
                  themeChange.darkTheme ? Colors.black12 : Colors.orange[200],
              child: ListTile(
                leading: Icon(Icons.verified_user),
                title: Text('Profile'),
                onTap: () => {
                  Get.to(() => completInfo == false
                      ? CompleteInformationBody()
                      : profileScreen())
                },
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            Container(
              color: themeChange.darkTheme ? Colors.black12 : Colors.amber[200],
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => {Navigator.popAndPushNamed(context, "11")},
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            Container(
              color:
                  themeChange.darkTheme ? Colors.black12 : Colors.yellow[200],
              child: ListTile(
                leading: Icon(Icons.border_color),
                title: Text('Feedback'),
                onTap: () => {Navigator.popAndPushNamed(context, "12")},
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("about us"),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "8");
                  },
                ),
                ElevatedButton(
                  child: Text("follow us"),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "7");
                  },
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.01,
            ),
            Center(
              child: ElevatedButton.icon(
                  label: Text("Log ouT"),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.popAndPushNamed(context, "5");
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
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  child: GestureDetector(
                    child: Image.asset(
                      "assets/bulb.png",
                      color:
                          themeChange.darkTheme ? Colors.white : Colors.black,
                    ),
                    onTap: () {
                      //
                    },
                  ),
                ),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.2,
                ),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 235,
              ),
              child: Container(
                child: Text(themeChange.darkTheme ? 'Dark mode' : 'Light mode'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

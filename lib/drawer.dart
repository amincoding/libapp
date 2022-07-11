import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:viplive/core/constants.dart';
import 'package:viplive/core/utils/sizeConfig.dart';
import 'package:viplive/drawer_screens/Settings.dart';
import 'package:viplive/drawer_screens/about_us_screen.dart';
import 'package:viplive/drawer_screens/feedback.dart';
import 'package:viplive/drawer_screens/follow_us_screen.dart';
import 'package:viplive/drawer_screens/profile.dart';
import 'package:viplive/features/splash/presentation/onBoarding/presentation/complete_information/widgets/complete_information_body.dart';
import 'package:viplive/screens/signin_email.dart';
import 'package:viplive/theme_services.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  final user = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid.toString())
      .get()
      .then((doc) => doc.data());
  static const moon = CupertinoIcons.moon_stars;
  static const sun = CupertinoIcons.sun_haze;
  static const bulb = CupertinoIcons.lightbulb;

  IconData anIcon =
      ThemeService().getThemeMode() == ThemeMode.dark ? sun : moon;
  Color aColor = ThemeService().getThemeMode() == ThemeMode.dark
      ? Colors.white
      : Colors.black;

  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.only(right: 5, bottom: 25),
            child: Column(
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
                  height: SizeConfig.screenHeight! * 0.01,
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("USERNAME : ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: KFont)),
                        Text(user.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: KFont)),
                        Text("RULE : ",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: KFont)),
                        Text("",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontFamily: KFont))
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.03,
          ),
          Container(
            color: ThemeService().getThemeMode() == ThemeMode.dark
                ? Colors.teal.shade400
                : Colors.deepOrangeAccent.shade200,
            child: ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Profile',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: KFont)),
              onTap: () => {Navigator.popAndPushNamed(context, "12")},
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          Container(
            color: ThemeService().getThemeMode() == ThemeMode.dark
                ? Colors.teal.shade400
                : Colors.deepOrangeAccent.shade200,
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: KFont)),
              onTap: () => {Navigator.popAndPushNamed(context, "11")},
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          Container(
            color: ThemeService().getThemeMode() == ThemeMode.dark
                ? Colors.teal.shade400
                : Colors.deepOrangeAccent.shade200,
            child: ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: KFont)),
              onTap: () => {Navigator.popAndPushNamed(context, "12")},
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.teal)),
                child: Text("about us",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: KFont)),
                onPressed: () {
                  Navigator.popAndPushNamed(context, "8");
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.teal)),
                child: Text("follow us",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: KFont)),
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
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.teal),
                    shadowColor: MaterialStateProperty.all<Color>(Colors.teal)),
                label: Text("Log ouT",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: KFont)),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.popAndPushNamed(context, "5");
                },
                icon: Icon(Icons.exit_to_app)),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          Center(
            child: Container(
              child: Text(
                "all rights are reserved to Belbali company 2022 ®",
                style: TextStyle(
                    color: Colors.red, fontSize: 12, fontFamily: KFont),
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                  onPressed: () {},
                  child: Icon(bulb)),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.2,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.teal)),
                  child: Icon((isDark == false ? sun : moon)),
                  onPressed: () {
                    ThemeService().changeTheme();
                    setState(() {
                      isDark = !isDark;
                    });
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
